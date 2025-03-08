extends Node2D

@export_subgroup("Nodes")
@export var animation_player:AnimationPlayer
@export var scale_changer:AnimationPlayer
@export var explosion: PackedScene
@export var explosion_spawn_point_1: Marker2D
@export var explosion_spawn_point_2: Marker2D
@export var explosion_spawn_point_3: Marker2D

@export_subgroup("Settings")
@export var speed: float = 150.00


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
		area.get_parent().queue_free()
		self.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		SignalManager.emit_signal("deduct_from_player_health", 1)
