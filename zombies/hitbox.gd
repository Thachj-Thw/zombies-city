extends Area2D


var hps: float = 2

func _on_hitbox_area_entered(area):
	$CollisionShape2D.set_deferred("disabled", true)
	yield(get_tree().create_timer(1/hps), "timeout")
	$CollisionShape2D.set_deferred("disabled", false)
