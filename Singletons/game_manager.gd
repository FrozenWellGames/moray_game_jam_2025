extends Node


@export_subgroup("Nodes")
@export var reactivate_player_damage_timer: Timer

var score: int = 20
var high_score: int = 15440
var player_health: int = 5
var player_can_take_damage: bool = true

var current_planet_group_id: int = 1


var player_laser_group_id = 0
var player_laser_position_in_group = 0
var multiplier = 1

var player: CharacterBody2D


func _ready() -> void:
	player_can_take_damage = true
	SignalManager.add_to_score.connect(update_score)
	SignalManager.set_score_to_zero.connect(reset_score)
	SignalManager.deduct_from_player_health.connect(update_player_health)
	SignalManager.reset_player_health.connect(reset_player_health)
	SignalManager.update_current_planet_group_id.connect(update_current_planet_id)
	SignalManager.reset_current_planet_group_id.connect(reset_current_planet_id)
	SignalManager.reactivate_player_can_take_damage.connect(activate_player_can_take_damage)

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


func activate_player_can_take_damage() -> void:
	reactivate_player_damage_timer.start()


func _on_timer_timeout() -> void:
	player_can_take_damage = true
