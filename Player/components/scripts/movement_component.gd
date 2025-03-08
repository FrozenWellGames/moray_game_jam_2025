class_name MovementComponent
extends Node

@export_subgroup("settings")
@export var speed: float = 1.0

var angle = 0.0

func handle_movement(player_body: CharacterBody2D, direction: float, delta: float, rotation_center: Marker2D) -> void:
	var screen_size = player_body.get_viewport_rect().size
	var radius = min(screen_size.x, screen_size.y) / 2 - 60
	
	angle -= direction * speed * delta

	player_body.position.x = rotation_center.position.x + radius * cos(angle)
	player_body.position.y = rotation_center.position.y + radius * sin(angle)
	print((screen_size.x / 100) * 37)
