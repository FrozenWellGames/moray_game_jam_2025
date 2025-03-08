extends Node2D

@export_subgroup("Nodes")
@export var animation_player:AnimationPlayer


func _ready() -> void:
	#animation_player.stop()
	animation_player.play("explosion")


func destroy_anim() -> void:
	queue_free()
