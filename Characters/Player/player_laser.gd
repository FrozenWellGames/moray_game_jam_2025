class_name PlayerLaser
extends Node2D



@export_subgroup("nodes")
@export var player_hit_sfx: AudioStream
@export_subgroup("settings")
@export var speed: float = 400.00


func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and GameManager.player_can_take_damage:
		GameManager.player_can_take_damage = false
		SignalManager.emit_signal("deduct_from_player_health", 1)
		SignalManager.emit_signal("play_sfx", player_hit_sfx)
		await get_tree().create_timer(0.2).timeout
		GameManager.player_can_take_damage = true
		queue_free()
