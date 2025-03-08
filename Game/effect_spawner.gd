extends Node2D


func _ready() -> void:
	SignalManager.spawn_effect.connect(on_spawn_effect)

func on_spawn_effect(GameObject: PackedScene, Position: Vector2) -> void:
	var effect: Node2D = GameObject.instantiate()
	effect.position = Position
	add_child(effect)
