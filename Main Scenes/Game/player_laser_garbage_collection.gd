extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_laser"):
		area.get_parent().queue_free()
