extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "PlayerLaser":
		area.get_parent().queue_free()
