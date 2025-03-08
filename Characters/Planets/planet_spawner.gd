extends Node2D

@export_subgroup("Nodes")
@export var group_timer:Timer
@export var planet: PackedScene
@export var rotation_center: Marker2D



func on_spawn_asteroid( Rotation: float) -> void:
	for n in 3:
		pass
		var plan: Node2D = planet.instantiate()
		plan.rotation = Rotation
		plan.position = rotation_center.global_position
		plan.group_id = GameManager.current_planet_group_id
		add_child(plan)
		await get_tree().create_timer(0.75).timeout
	group_timer.start()



func _on_group_timer_timeout() -> void:
	var rand_rotation = randf_range(0, 360)
	on_spawn_asteroid(rand_rotation)
