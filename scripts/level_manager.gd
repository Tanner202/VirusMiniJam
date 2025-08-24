class_name LevelManager extends Node

@export var lose_sound: AudioStream
signal game_ended(bool)

func game_over():
	AudioManager.play_sound_effect(lose_sound)
	game_ended.emit(false)
	get_tree().paused = true
