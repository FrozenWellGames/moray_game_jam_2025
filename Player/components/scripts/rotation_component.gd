class_name RotationComponent
extends Node


func handle_rotation(player_body: CharacterBody2D) -> void:
	var screen_center = get_viewport().get_visible_rect().size / 2
	var direction = (Vector2(screen_center.x, screen_center.y) - player_body.global_position).normalized()
	player_body.angle = direction.angle()
	player_body.rotation = player_body.angle
