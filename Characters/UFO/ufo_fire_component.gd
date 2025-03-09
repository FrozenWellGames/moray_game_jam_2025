class_name UFOFireComponent
extends Node

@export_subgroup("Nodes")
@export var projectile: PackedScene
@export var firing_timer: Timer
@export var bullet_spawn_point: Marker2D
@export var ufo_laser_sfx: AudioStream


func handle_fire() -> void:
	var angle_to_player = bullet_spawn_point.global_position.direction_to(GameManager.player.global_position).angle()
	firing_timer.start()
	SignalManager.emit_signal("spawn_bullet", projectile, bullet_spawn_point.global_position, angle_to_player)
	SignalManager.emit_signal("play_sfx", ufo_laser_sfx)

func _on_cooldown_timer_timeout() -> void:
	handle_fire()
