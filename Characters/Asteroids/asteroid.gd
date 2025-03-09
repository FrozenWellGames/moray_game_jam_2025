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

func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "PlayerLaser":
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_1.global_position)
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_2.global_position)
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_3.global_position)
		SignalManager.emit_signal("add_to_score", 10)
		SignalManager.emit_signal("play_sfx", explosion_sfx)
		area.get_parent().queue_free()
		self.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and GameManager.player_can_take_damage:
		GameManager.player_can_take_damage = false
		SignalManager.emit_signal("deduct_from_player_health", 1)
		SignalManager.emit_signal("play_sfx", player_hit_sfx)
		SignalManager.emit_signal("reactivate_player_can_take_damage")
		#await get_tree().create_timer(0.6).timeout
		#GameManager.player_can_take_damage = true
		#player_immune_time.start()


func _on_timer_timeout() -> void:
	GameManager.player_can_take_damage = true
