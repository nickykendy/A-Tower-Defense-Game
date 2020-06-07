class_name BuildSpace
extends Area2D

var data = null
var state: String = "free"# free taken
var tower: Tower

const TOWER: Resource = preload("res://Scenes/Tower.tscn")

func _ready():
	data = get_node("/root/Data")
	
	self.connect("body_entered", self, "_on_Area2D_body_entered")
	self.connect("body_exited", self, "_on_Area2D_body_exited")

func _on_Area2D_body_entered(body: KinematicBody2D) -> void:
	if body.name == "Controller":
		if state == "free" and body.tower != null:
			state = "taken"
			tower = body.tower
			if self.get_node("Tower") == null:
				body.remove_child(tower)
				self.add_child(tower)
				

func _on_Area2D_body_exited(body: KinematicBody2D) -> void:
	if body.name == "Controller":
		if state == "taken" and tower != null:
			state = "free"
			if self.get_node("Tower") != null:
				self.remove_child(tower)
				body.add_child(tower)
				tower = null
