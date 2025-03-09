extends Node2D

@export_subgroup("Nodes")
@export var animation_player: AnimationPlayer


func _ready() -> void:
	animation_player.play("galaxy")
