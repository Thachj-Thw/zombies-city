extends KinematicBody2D


var velocity: Vector2 = Vector2.LEFT
var speed: float = 1000.0
var damage: int = 100
var s_range: int = 150


func _physics_process(delta):
	move_and_collide(velocity * speed * delta)
	yield(get_tree().create_timer(s_range/speed), "timeout")
	queue_free()


func _on_hitbox_area_entered(area):
	queue_free()
