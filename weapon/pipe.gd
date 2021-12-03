extends Node2D


var hps: float = 1
var can_hit: bool = true
var damage: int = 20


func flip(x: float):
	if x < 0:
		$Position2D/Sprite.set_flip_h(true)
	else:
		$Position2D/Sprite.set_flip_h(false)


func attack(_aim):
	if can_hit:
		$Animation.play("attack")
		can_hit = false
		yield(get_tree().create_timer(1/hps), "timeout")
		can_hit = true


func disable():
	$hitbox/CollisionShape2D.set_deferred("disabled", true)

func enable():
	$hitbox/CollisionShape2D.set_deferred("disabled", false)
