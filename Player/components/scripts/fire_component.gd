class_name FireComponent
extends Node

@export_subgroup("Nodes")
@export var projectile: PackedScene
@export var cooldown_timer: Timer

var is_firing: bool = false


func handle_fire(body: CharacterBody2D, want_to_fire: bool) -> void:
	if want_to_fire and not is_firing:
		print("Pew Pew!")
		is_firing = true
		cooldown_timer.start()
		var bullet = projectile.instantiate()
		body.get_parent().add_child(bullet)
		bullet.global_position = body.global_position
		bullet.rotation = body.rotation


func _on_cooldown_timer_timeout() -> void:
	is_firing = false
