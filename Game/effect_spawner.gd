extends Node2D

@export_subgroup("Nodes")
@export var delay_timer: Timer
var game_object: PackedScene
var spawn_position: Vector2
var delay: float

func _ready() -> void:
	SignalManager.spawn_effect.connect(on_spawn_effect)

func on_spawn_effect(GameObject: PackedScene, Position: Vector2) -> void:
	game_object = GameObject
	spawn_position = Position
	handle_spawn()
	

func handle_spawn() -> void:
	var effect: Node2D = game_object.instantiate()
	effect.position = spawn_position
	add_child(effect)


func _on_delay_timer_timeout() -> void:
	handle_spawn()
