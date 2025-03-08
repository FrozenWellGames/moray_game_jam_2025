extends Node


var score: int = 20
var high_score : int = 0


func _ready() -> void:
	SignalManager.add_to_score.connect(update_score)

func update_score(value: int) -> void:
	score += value

func reset_score() -> void:
	score = 0
