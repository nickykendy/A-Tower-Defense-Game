class_name Tower
extends KinematicBody2D

onready var sprite = $Sprite
onready var progress = $BuildTime
onready var timer = $Timer

var towerId: String
var buildTime: float = 2.0

func _ready():
	sprite.modulate = Color(1.0, 1.0, 1.0, 0.5)
	progress.value = 0
	timer.wait_time = 2

func _process(delta):
	if progress.visible == true:
		progress.value = timer.time_left

func _on_Timer_timeout():
	sprite.modulate = Color(1, 1, 1, 1)
	progress.visible = false
