extends Node2D

@export_subgroup("Nodes")
@export var animation_player: AnimationPlayer
@export var scale_changer: AnimationPlayer
@export var explosion: PackedScene
@export var explosion_spawn_point_1: Marker2D
@export var explosion_spawn_point_2: Marker2D
@export var explosion_spawn_point_3: Marker2D
@export var player_immune_time: Timer
@export var explosion_sfx: AudioStream
@export var player_hit_sfx: AudioStream
@export var ufo_sfx: AudioStream
@export var music_timer: Timer

@export_subgroup("Settings")
@export var speed: float = 150.00


var angle: float = 0.0 # Current angle in radians
var radius: float = 0.0 # Current radius from the center
var angular_speed: float = 1.0 # Speed of angle change (radians per second)
var radial_speed: float = 50.0 # Speed of radius increase (pixels per second)
var center: Vector2 # Center of the screen

func _ready() -> void:
	animation_player.play("asteroid")
	scale_changer.play("scale_up")


	# Set the center of the screen
	center = get_viewport_rect().size / 2
	position = center # Start at the center

func _process(delta):
	# Update the angle and radius
	angle += angular_speed * delta
	radius += radial_speed * delta

	# Calculate the new position using polar coordinates
	var offset = Vector2(cos(angle), sin(angle)) * radius
	position = center + offset

	# Check if the enemy has left the viewport
	if not get_viewport_rect().has_point(position):
		queue_free() # Remove the enemy when it leaves the viewport


func _on_area_2d_area_entered(area: Area2D) -> void:
	#if area.get_parent().name == "PlayerLaser":
	if area.is_in_group("player_laser"):
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_1.global_position)
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_2.global_position)
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_3.global_position)
		SignalManager.emit_signal("add_to_score", 80)
		SignalManager.emit_signal("play_sfx", explosion_sfx)
		area.get_parent().queue_free()
		self.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and GameManager.player_can_take_damage:
		GameManager.player_can_take_damage = false
		SignalManager.emit_signal("deduct_from_player_health", 1)
		SignalManager.emit_signal("play_sfx", player_hit_sfx)
		SignalManager.emit_signal("reactivate_player_can_take_damage")


func _on_timer_timeout() -> void:
	GameManager.player_can_take_damage = true


func _on_music_timer_timeout() -> void:
	SignalManager.emit_signal("play_sfx", ufo_sfx)
