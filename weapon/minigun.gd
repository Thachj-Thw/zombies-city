extends Node2D

class_name Gun


export(float) var hps: float = 1.0
export(int) var damage: int = 50
export(int) var shoot_range: int = 300
var can_hit: bool = true

onready var bullet = preload("res://weapon/bullet.tscn")


func flip(x: float):
	if x < 0:
		$Sprite.set_flip_h(true)
	else:
		$Sprite.set_flip_h(false)


func attack(aim: Vector2):
	if can_hit:
		var b = bullet.instance()
		b.damage = damage
		b.velocity = aim
		b.s_range = shoot_range
		b.rotation = -aim.angle_to(Vector2.UP)
		$Animation.play("attack")
		Global.instance_node(b, $Sprite/Position2D.global_position)
		can_hit = false
		yield(get_tree().create_timer(1/hps), "timeout")
		can_hit = true
