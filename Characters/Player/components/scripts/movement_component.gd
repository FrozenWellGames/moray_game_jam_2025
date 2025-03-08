class_name MovementComponent
extends Node

@export_subgroup("settings")
@export var speed: float = 2.1

var angle = 0.0

func handle_movement(player_body: CharacterBody2D, direction: float, delta: float, rotation_center: Marker2D) -> void:
	var screen_size = player_body.get_viewport_rect().size
	var radius = min(screen_size.x, screen_size.y) / 2 - 60
	
	angle -= direction * speed * delta

	var oval_radius_x = radius * 1.3
	var oval_radius_y = radius * 0.9

	player_body.position.x = rotation_center.position.x + oval_radius_x * cos(angle)
	player_body.position.y = rotation_center.position.y + oval_radius_y * sin(angle)
