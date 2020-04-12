class_name Card
extends Area2D

var initPos: Vector2 = Vector2()
var state: String = "free"
var tower

onready var sprite = $Sprite

export (String) var Name
export (float) var Cost

func _ready():
	self.connect("body_exited", self, "_on_Area2D_body_exited")

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Controller":
			if body.state == "free":
				body.card = self
				body.state = "selected"
				change_state("selected")
				
	if state == "held":
		var mousePosition = get_global_mouse_position()
		global_position = mousePosition
		
func _on_Area2D_body_exited(body: KinematicBody2D) -> void:
	if body.name == "Controller":
		if body.card == self and body.state == "selected":
			body.card = null
			body.state = "free"
			change_state("free")

func change_state(newState):
	if state == "free" and newState == "selected":
		position.y -= 20
		state = "selected"
	elif state == "selected" and newState == "held":
		state = "held"
		z_index = 1
	elif state == "held" and newState == "free":
		state = "free"
		position = initPos
		z_index = 0
	elif state == "selected" and newState == "free":
		position.y += 20
		state = "free"

func save_pos(pos: Vector2):
	initPos = pos
