class_name MovementComponent
extends Node

@export_subgroup("settings")
@export var speed: float = 1.0

var angle = 0.0

func handle_movement(player_body: CharacterBody2D, direction: float, delta: float) -> void:
	var screen_size = player_body.get_viewport_rect().size
	var radius = min(screen_size.x, screen_size.y) / 2 - 40
	
	angle -= direction * speed * delta

	player_body.position.x = screen_size.x / 2 + radius * cos(angle)
	player_body.position.y = screen_size.y / 2 + radius * sin(angle)
