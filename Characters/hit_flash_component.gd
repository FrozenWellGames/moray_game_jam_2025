extends Node

@export var sprite: Sprite2D

var hit_flash_material = preload("res://Characters/hit_flash_component.tres")
var hit_flash_tween: Tween

func _ready() -> void:
	SignalManager.deduct_from_player_health.connect(on_player_hit)
	sprite.material = hit_flash_material

func on_player_hit(_value: int) -> void:
	for n in 3:
		if hit_flash_tween != null && hit_flash_tween.is_valid():
			hit_flash_tween.kill()
		(sprite.material as ShaderMaterial).set_shader_parameter("lerp_percent", 1.0)
		hit_flash_tween = create_tween()
		hit_flash_tween.tween_property(sprite.material, "shader_parameter/lerp_percent", 0.0, 0.2)
		await get_tree().create_timer(0.2).timeout
