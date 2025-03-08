extends Node2D

@export_subgroup("Nodes")
@export var timer:Timer
@export var planet: PackedScene
@export var rotation_center: Marker2D



func on_spawn_asteroid( Rotation: float) -> void:
	var plan: Node2D = planet.instantiate()
	plan.rotation = Rotation
	plan.position = rotation_center.global_position
	plan.group_id = GameManager.current_planet_id
	add_child(plan)
	
	timer.start()

func _on_timer_timeout() -> void:
	var rand_rotation = randf_range(0, 360)
	on_spawn_asteroid(rand_rotation)
