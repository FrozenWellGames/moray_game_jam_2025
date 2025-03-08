extends Node2D

@export_subgroup("Nodes")
@export var animation_player: AnimationPlayer
var group_id: int


func _enter_tree() -> void:
	pass

func _ready() -> void:
	animation_player.play("planet")
	group_id = GameManager.current_planet_group_id
