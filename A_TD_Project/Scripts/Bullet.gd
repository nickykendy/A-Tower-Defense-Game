extends Area2D
class_name Bullet

var velocity: Vector2
var acceleration: Vector2
var speed: int = 1000
var steer_force: int = 200
var target

onready var lifeTime = $LifeTimer


func _ready():
	set_as_toplevel(true)


func start(_position:Vector2, _direction:Vector2, _target=null) -> void:
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	target = _target


func seek() -> Vector2:
	var desired = (target.position - position).normalized() * speed
	var steer = (desired - velocity).normalized() * steer_force
	return steer


func _process(delta):
	if target:
		acceleration += seek()
		velocity += acceleration * delta
		velocity = velocity.clamped(speed)
		rotation = velocity.angle()
	position += velocity * delta


func _on_LifeTimer_timeout():
	_on_hit()


func _on_Bullet_body_entered(body: KinematicBody2D) -> void:
	if body.is_in_group("Enemy"):
		print("Hit The Enemy!")
		_on_hit()


func _on_hit():
	queue_free()
