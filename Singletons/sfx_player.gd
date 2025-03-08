extends AudioStreamPlayer


func _ready() -> void:
	SignalManager.play_sfx.connect(on_play_sfx)

func on_play_sfx(SFX:AudioStream) -> void:
	self.stream = SFX
	self.set_volume_db(2.0)
	self.play()
