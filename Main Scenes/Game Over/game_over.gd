extends Node2D

@export_subgroup("Nodes")
@export var game_scene: PackedScene


func _ready() -> void:
	if GameManager.score > GameManager.high_score:
		GameManager.high_score = GameManager.score

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("fire"):
		_on_Button_pressed()

func _on_Button_pressed():
	SignalManager.emit_signal("set_score_to_zero")
	get_tree().change_scene_to_file("res://Main Scenes/Main Menu/main_menu.tscn")
