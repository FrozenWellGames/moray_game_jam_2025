extends Node2D

@export_subgroup("Nodes")
@export var animation_player:AnimationPlayer

@export var scale_changer:AnimationPlayer
@export var speed: float = 150.00

@export var explosion: PackedScene
@export var explosion_spawn_point_1: Marker2D
@export var explosion_spawn_point_2: Marker2D
@export var explosion_spawn_point_3: Marker2D

func _ready() -> void:
	#print(randi() % 5)
	animation_player.play("asteroid")
	scale_changer.play("scale_up")

func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "PlayerLaser":
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_1.global_position)
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_2.global_position)
		SignalManager.emit_signal("spawn_effect", explosion, explosion_spawn_point_3.global_position)
		area.get_parent().queue_free()
	self.queue_free()
	pass # Replace with function body.
