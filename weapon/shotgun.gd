extends Node2D


var hps: float = 0.3
var damage: int = 100
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
		b.rotation = -aim.angle_to(Vector2.UP)
		var b2 = bullet.instance()
		var aim2 = aim.rotated(deg2rad(20))
		b2.damage = damage
		b2.velocity = aim2
		b.rotation = -aim2.angle_to(Vector2.UP)
		var b3 = bullet.instance()
		var aim3 = aim.rotated(deg2rad(-20))
		b3.damage = damage
		b3.velocity = aim3
		b3.rotation = -aim3.angle_to(Vector2.UP)
		$Animation.play("attack")
		Global.instance_node(b, $Sprite/Position2D.global_position)
		Global.instance_node(b2, $Sprite/Position2D.global_position)
		Global.instance_node(b3, $Sprite/Position2D.global_position)
		can_hit = false
		yield(get_tree().create_timer(1/hps), "timeout")
		can_hit = true
