extends KinematicBody2D

class_name Player

export(int) var heal: int = 100
export(float) var speed: float = 100.0
var velocity: Vector2 = Vector2.ZERO
var aim: Vector2 = Vector2.ZERO
var index: int = 0

onready var pistol = preload("res://weapon/minigun.tscn")
onready var shotgun = preload("res://weapon/shotgun.tscn")
onready var rifle = preload("res://weapon/rifle.tscn")
onready var pipe = preload("res://weapon/pipe.tscn")


func _unhandled_input(_event):
	velocity = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
#	var p = global_position - $basePosition.global_position
#	var m = $basePosition/mouse.position
	aim = (
		get_viewport().get_mouse_position() - ($hand.global_position - $basePosition.global_position)
	).normalized()
	if Input.is_key_pressed(KEY_N):
		$hand.update_bag([pipe.instance(), 
						rifle.instance(), 
						pistol.instance(), 
						shotgun.instance(), 
						null])
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		$hand.hit()

func _physics_process(_delta):
	if velocity: # != (0, 0)
		$AnimationPlayer.play("run")
	else:
		$AnimationPlayer.play("idle")
	move_and_slide(velocity * speed)


func _on_hurtbox_area_entered(area):
	heal -= area.get_parent().damage
	$Label.text = str(heal) + "/100"
