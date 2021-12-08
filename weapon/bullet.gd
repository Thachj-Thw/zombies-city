extends KinematicBody2D


var velocity: Vector2 = Vector2.LEFT
var speed: float = 1000.0
var damage: int = 100
var s_range: int = 150


func _ready():
	$Timer.start(s_range/speed)


func _physics_process(delta):
	move_and_collide(velocity * speed * delta)


func _on_hitbox_area_entered(_area):
	queue_free()


func _on_Timer_timeout():
	print("timeout")
	print($Timer.wait_time)
	queue_free()
