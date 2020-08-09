class_name Tower
extends KinematicBody2D

onready var sprite = $Sprite
onready var progress = $BuildTime
onready var timer = $Timer
onready var pivot = $Pivot

var towerId: String
var buildTime: float = 2.0
var bBuild: bool = false

const BULLET : Resource = preload("res://Scenes/Bullet.tscn")


func _ready():
	sprite.modulate = Color(1.0, 1.0, 1.0, 0.5)
	progress.value = 0
	timer.wait_time = 2


func _process(delta):
	if progress.visible == true:
		progress.value = timer.time_left
		
	if bBuild:
		var target = find_target()
		yield(get_tree().create_timer(1.0), "timeout")
		fire(target)


func _on_Timer_timeout():
	sprite.modulate = Color(1, 1, 1, 1)
	progress.visible = false
	bBuild = true


func begin_construct() -> void:
	timer.start()


func find_target():
	var _enemies = get_tree().get_nodes_in_group("Enemy")
	var _index = 0
	var _distance = _enemies[_index].global_position.distance_to(global_position)
	for i in _enemies.size():
		if _enemies[i].global_position.distance_to(global_position) < _distance:
			_distance = _enemies[i].global_position.distance_to(global_position)
			_index = i
	return _enemies[_index]


func fire(_target):
	var _b = BULLET.instance()
	pivot.add_child(_b)
	_b.add_force(global_position, _target.global_position)
	
