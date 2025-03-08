class_name PlayerAnimationComponent
extends Node

@export_subgroup("nodes")
@export var player_sprite: Sprite2D
@export var animation_player: AnimationPlayer


func handle_player_animation() -> void:
	animation_player.play("fly_level")
