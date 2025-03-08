class_name FireComponent
extends Node

@export_subgroup("Nodes")
@export var projectile: PackedScene
@export var cooldown_timer: Timer
@export var bullet_spawn_point: Marker2D

var is_firing: bool = false


func handle_fire(body: CharacterBody2D, want_to_fire: bool) -> void:
	if want_to_fire and not is_firing:
		is_firing = true
		cooldown_timer.start()
		SignalManager.emit_signal("spawn_bullet", projectile, bullet_spawn_point.global_position, body.rotation)


func _on_cooldown_timer_timeout() -> void:
	is_firing = false
