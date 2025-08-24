extends Node

@export var music: AudioStream

func _ready() -> void:
	AudioManager.set_music(music)
