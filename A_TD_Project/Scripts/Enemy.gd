extends KinematicBody2D
class_name Enemy

export (int) var HP = 100



func _ready():
	pass


func _process(delta):
	pass


func on_dead():
	queue_free()
