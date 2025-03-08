class_name InputComponent
extends Node

var input_horizontal: float = 0.0

func _process(_delta: float) -> void:
	input_horizontal = Input.get_axis("move_left", "move_right")


func get_fire_input_just_pressed() -> bool:
	return Input.is_action_just_pressed("fire")


func get_fire_input_pressed() -> bool:
	return Input.is_action_pressed("fire")
