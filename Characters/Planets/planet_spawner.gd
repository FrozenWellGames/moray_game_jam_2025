extends Node2D

@export_subgroup("Nodes")
@export var group_timer:Timer
@export var planet: PackedScene
@export var rotation_center: Marker2D



func on_spawn_asteroid( Rotation: float) -> void:
	var planet_no: int = 1
	for n in 4:
		var plan: Node2D = planet.instantiate()
		plan.rotation = Rotation
		plan.position = rotation_center.global_position
		plan.group_id = GameManager.current_planet_group_id
		plan.position_in_group = planet_no
		planet_no +=1
		add_child(plan)
		await get_tree().create_timer(0.75).timeout
		 
	SignalManager.emit_signal("update_current_planet_group_id")
	group_timer.start()



func _on_group_timer_timeout() -> void:
	var rand_rotation = randf_range(0, 360)
	on_spawn_asteroid(rand_rotation)
