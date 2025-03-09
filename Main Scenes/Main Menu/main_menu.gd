extends Node2D

@export_subgroup("Nodes")
@export var game_scene: PackedScene
@export var high_score_label:Label

func _process(_delta: float) -> void:
	high_score_label.text = ("HIGH SCORE: " + str(GameManager.high_score))
	if Input.is_action_just_pressed("fire"):
		_on_Button_pressed()

func _on_Button_pressed():
	SignalManager.emit_signal("reset_player_health")
	SignalManager.emit_signal("set_score_to_zero")
	get_tree().change_scene_to_file("res://Main Scenes/Game/game.tscn")
