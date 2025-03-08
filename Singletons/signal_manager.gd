extends Node


signal spawn_bullet(GameObject, Position, Rotation)
signal spawn_effect(GameObject, Position)
signal add_to_score(value_to_add)
signal set_score_to_zero()
signal update_high_score(value_to_add)
signal deduct_from_player_health(value_to_deduct)
signal reset_player_health()
signal play_sfx(SFX)
signal update_current_planet_group_id()
signal reset_current_planet_group_id()
