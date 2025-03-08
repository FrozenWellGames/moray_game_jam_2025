extends Node2D

@export_subgroup("Nodes")
@export var animation_player: AnimationPlayer
@export var scale_changer:AnimationPlayer
@export_subgroup("Settings")
@export var speed: float = 100.00

var group_id: int


func _ready() -> void:
	animation_player.play("planet")
	group_id = GameManager.current_planet_group_id


func _process(delta: float) -> void:
	position += transform.x * speed * delta
