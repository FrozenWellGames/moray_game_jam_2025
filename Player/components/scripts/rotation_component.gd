class_name RotationComponent
extends Node


func handle_rotation(player_body: CharacterBody2D, rotation_center: Marker2D) -> void:
	var direction = (Vector2(rotation_center.position.x, rotation_center.position.y) - player_body.global_position).normalized()
	player_body.angle = direction.angle()
	player_body.rotation = player_body.angle
