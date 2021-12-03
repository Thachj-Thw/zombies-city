extends Node2D


func instance_node(node: Node, pos: Vector2) -> void:
	node.global_position = pos
	add_child(node)
