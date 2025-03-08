extends Node2D


func _ready() -> void:
	SignalManager.spawn_bullet.connect(on_spawn_bullet)

func on_spawn_bullet(GameObject: PackedScene, Position: Vector2, Rotation: float) -> void:
	var bullet: Node2D = GameObject.instantiate()
	bullet.rotation = Rotation
	bullet.position = Position
	add_child(bullet)
