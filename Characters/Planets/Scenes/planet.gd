extends Node2D

@export_subgroup("Nodes")
@export var animation_player: AnimationPlayer
@export var scale_changer:AnimationPlayer
@export var explosion: PackedScene
@export var explosion_spawn_point_1: Marker2D
@export var explosion_spawn_point_2: Marker2D
@export var explosion_spawn_point_3: Marker2D
@export var player_immune_time: Timer
@export var explosion_sfx : AudioStream
@export var player_hit_sfx : AudioStream

@export_subgroup("Settings")
@export var speed: float = 100.00

var group_id: int
var position_in_group:int

var player_laser_group_id = 0
var player_laser_position_in_group = 0


func _ready() -> void:
	animation_player.play("planet")
	scale_changer.play("scale_up")
	group_id = GameManager.current_planet_group_id


func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "PlayerLaser":		
		if GameManager.player_laser_group_id == 0 and position_in_group == 1:
			GameManager.player_laser_group_id = group_id
			GameManager.player_laser_position_in_group  = position_in_group + 1
			GameManager.multiplier = GameManager.multiplier * 2
		elif GameManager.player_laser_group_id == group_id and GameManager.player_laser_position_in_group == position_in_group:
			GameManager.multiplier = GameManager.multiplier * 2
			GameManager.player_laser_position_in_group  = position_in_group + 1
		elif GameManager.player_laser_group_id == group_id and GameManager.player_laser_position_in_group != position_in_group:
			GameManager.multiplier = 1
			GameManager.player_laser_group_id = 0
			GameManager.player_laser_position_in_group = 0
		elif GameManager.player_laser_group_id != group_id and position_in_group == 1:
			GameManager.multiplier = 2
			GameManager.player_laser_group_id = group_id
			GameManager.player_laser_position_in_group = position_in_group + 1
		else:
			GameManager.multiplier = 1
			GameManager.player_laser_group_id = 0
			GameManager.player_laser_position_in_group = 0
			
		
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_1.global_position)
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_2.global_position)
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_3.global_position)
		SignalManager.emit_signal("add_to_score", 20 * GameManager.multiplier)
		SignalManager.emit_signal("play_sfx",explosion_sfx)
		area.get_parent().queue_free()
		self.queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and GameManager.player_can_take_damage:
		SignalManager.emit_signal("deduct_from_player_health", 1)
		GameManager.player_can_take_damage = false
		SignalManager.emit_signal("play_sfx",player_hit_sfx)
		player_immune_time.start()


func _on_timer_timeout() -> void:
	GameManager.player_can_take_damage = true
