extends Position2D

onready var screen = OS.get_screen_size()

func _unhandled_input(event):
	position = get_viewport().get_mouse_position()
	position.x = clamp(position.x, 100, screen.x - 500)
	position.y = clamp(position.y, 100, screen.y - 300)
