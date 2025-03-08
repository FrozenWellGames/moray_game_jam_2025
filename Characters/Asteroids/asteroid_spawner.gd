extends Node2D

@export_subgroup("Nodes")
@export var timer:Timer
@export var asteroid: PackedScene
@export var rotation_center: Marker2D



func on_spawn_asteroid( Rotation: float) -> void:
	var ast: Node2D = asteroid.instantiate()
	ast.rotation = Rotation
	ast.position = rotation_center.global_position
	add_child(ast)
	timer.start()

func _on_timer_timeout() -> void:
	var rand_rotation = randf_range(0, 360)
	on_spawn_asteroid(rand_rotation)
