extends AudioStreamPlayer


@export var background_music: AudioStream

func _ready() -> void:
	self.stream = background_music
	self.set_volume_db(-20.0)
	self.play()
