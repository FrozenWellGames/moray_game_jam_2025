class_name PlayerLaser
extends Node2D

@export_subgroup("settings")
@export var speed: float = 600.00

var direction = Vector2.ZERO


func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
