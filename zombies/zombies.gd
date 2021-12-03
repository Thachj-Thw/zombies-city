extends KinematicBody2D

class_name Zombie


var velocity: Vector2 = Vector2.ZERO
var damage: int = 10
var speed: float = 75.0
var heal: int = 1000
var object
var visibility: Vector2 = Vector2.ZERO

onready var ray := $visibility/RayCast2D


func _physics_process(_delta):
	if object:
		visibility = object.global_position - self.global_position
		ray.set_cast_to(visibility)
		if ray.get_collider() == object:
			velocity = visibility.normalized()
			$AnimationPlayer.play("run")
			if velocity.x > 0:
				$body.set_flip_h(true)
			elif velocity.x < 0:
				$body.set_flip_h(false)
		else:
			$AnimationPlayer.play("idle")
			velocity = Vector2.ZERO
	move_and_slide(velocity * speed)


func _on_visibility_area_entered(area):
	if not object:
		object = area


func _on_visibility_area_exited(area):
	if area == object:
		object = null
		$AnimationPlayer.play("idle")
		velocity = Vector2.ZERO


func _on_hurtbox_area_entered(area):
	heal -= area.get_parent().damage
	$Label.text = str(heal) + "/1000"
	if heal <= 0:
		queue_free()
