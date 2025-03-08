extends CharacterBody2D

@export_subgroup("Nodes")
@export var input_component: InputComponent
@export var movement_component: MovementComponent
@export var rotation_component: RotationComponent
@export var fire_component: FireComponent
@export var animation_component: PlayerAnimationComponent
@export var rotation_center: Marker2D

var angle = 0.0


func _process(delta: float) -> void:
	movement_component.handle_movement(self, input_component.input_horizontal, delta, rotation_center)
	rotation_component.handle_rotation(self, rotation_center)
	fire_component.handle_fire(self, input_component.get_fire_input_just_pressed())
	animation_component.handle_player_animation()
	if GameManager.player_health <= 0:
		get_tree().change_scene_to_file("res://Game Over/game_over.tscn")
