extends Control

@export_subgroup("Nodes")
@export var score_label: Label
@export var lives_label: Label
@export var high_label: Label


func _process(_delta: float) -> void:
	score_label.text = ("SCORE:" + str(GameManager.score))
	lives_label.text = ("LIVES:" + str(GameManager.player_health))
	high_label.text = ("HIGH:" + str(GameManager.high_score))
