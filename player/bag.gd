extends Position2D


var vector_mouse: Vector2 = Vector2.ZERO
var index: int = 0

onready var space0 = preload("res://weapon/space.tscn").instance()
onready var space1 = preload("res://weapon/space.tscn").instance()
onready var space2 = preload("res://weapon/space.tscn").instance()
onready var space3 = preload("res://weapon/space.tscn").instance()
onready var space4 = preload("res://weapon/space.tscn").instance()
onready var spaces: Array = [space0, space1, space2, space3, space4]
onready var character = get_parent()


func _unhandled_input(event):
	rotation = -character.aim.angle_to(Vector2.UP)
	get_child(index).flip(character.aim.x)
	if Input.is_key_pressed(KEY_1):
		index = hide_excep(0)
	elif Input.is_key_pressed(KEY_2):
		index = hide_excep(1)
	elif Input.is_key_pressed(KEY_3):
		index = hide_excep(2)
	elif Input.is_key_pressed(KEY_4):
		index = hide_excep(3)
	elif Input.is_key_pressed(KEY_5):
		index = hide_excep(4)


func hide_excep(idx: int) -> int:
	for i in get_children():
		i.hide()
	get_child(idx).show()
	return idx


func update_bag(items: Array):
	var itms: Array = get_children()
	for i in itms:
		remove_child(i)
	for i in len(items):
		if items[i]:
			add_child(items[i])
		else:
			add_child(spaces[i])
	hide_excep(index)


func hit():
	get_child(index).attack($"..".aim)
