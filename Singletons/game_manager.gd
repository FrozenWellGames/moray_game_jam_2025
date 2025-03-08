extends Node


var score: int = 20
var high_score : int = 0
var player_health : int = 5
var current_planet_group_id : int = 1


func _ready() -> void:
	SignalManager.add_to_score.connect(update_score)
	SignalManager.set_score_to_zero.connect(reset_score)
	
	SignalManager.deduct_from_player_health.connect(update_player_health)
	SignalManager.reset_player_health.connect(reset_player_health)

func update_score(value: int) -> void:
	score += value

func reset_score() -> void:
	score = 0

func update_player_health(value: int) -> void:
	player_health -= value


func reset_player_health() -> void:
	player_health = 5

func update_current_planet_id() -> void:
	current_planet_group_id += 1

func reset_current_planet_id() -> void:
	current_planet_group_id = 1
