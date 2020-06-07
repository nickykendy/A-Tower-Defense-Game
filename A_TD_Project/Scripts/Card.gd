class_name Card
extends Area2D

var initPos: Vector2 = Vector2()
var state: String = "free" # free, hover
var isSelected: bool = false
var tower
var cardId: String

onready var sprite = $Sprite
onready var sprDisable = $Spr_cardDisable
onready var sprEnable = $Spr_cardEnable

export (String) var Name
export (float) var Cost

func _ready():
	self.connect("body_exited", self, "_on_Area2D_body_exited")

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Controller":
			change_state("hover")
		
func _on_Area2D_body_exited(body: KinematicBody2D) -> void:
	if body.name == "Controller":
		change_state("free")

func change_state(newState: String) -> void:
	if state == "free" and newState == "hover":
		position.y -= 10
		state = "hover"
	elif state == "hover" and newState == "free":
		position.y += 10
		state = "free"

func change_select(newSelected: bool) -> void:
	if newSelected:
		isSelected = true
		sprEnable.visible = true
	else:
		isSelected = false
		sprEnable.visible = false

func save_pos(pos: Vector2):
	initPos = pos
