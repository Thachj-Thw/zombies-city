extends YSort


export(float) var time_spawn = 20
export(float) var max_quantity = 20

onready var zombie = preload("res://zombies/zombies.tscn")


func _ready():
	$TimerSpawn.wait_time = time_spawn


func rand_num() -> float:
	var num = rand_range(300, 1000)
	return num * -1 if rand_range(-1, 1) < 0 else num


func _on_TimerSpawn_timeout():
	if get_child_count() <= max_quantity:
		var z = zombie.instance()
		z.global_position = get_parent().get_child(0).global_position + Vector2(rand_num(), rand_num())
		add_child(z)
