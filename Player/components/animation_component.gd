class_name AnimationComponent
extends Node

@export_subgroup("nodes")
@export var player_sprite: Sprite2D
@export var animation_player: AnimationPlayer


func handle_player_animation(move_direction: float) -> void:
	#if move_direction < -0.2:
		#animation_player.play("fly_left")
	#elif move_direction > 0.2:
		#animation_player.play("fly_right")
	#else:
		#animation_player.play("fly_level")
	animation_player.play("fly_level")
		
