extends Node2D

@export_subgroup("Nodes")
@export var animation_player:AnimationPlayer

@export var scale_changer:AnimationPlayer
@export var speed: float = 150.00

func _ready() -> void:
	#print(randi() % 5)
	animation_player.play("asteroid")
	scale_changer.play("scale_up")
	

func _process(delta: float) -> void:
	position += transform.x * speed * delta
