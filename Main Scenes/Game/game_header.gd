extends Control

@export_subgroup("Nodes")
@export var score_label: Label
@export var high_label: Label


func _process(_delta: float) -> void:
	score_label.text = str(GameManager.score)
	high_label.text = str(GameManager.high_score)
