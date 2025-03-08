extends Node2D

@export_subgroup("Nodes")
@export var game_scene: PackedScene

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fire"):
		_on_Button_pressed()

func _on_Button_pressed():
	get_tree().change_scene_to_file("res://Game/game.tscn")
