class_name LevelManager extends Node

@export var win_sound: AudioStream
@export var lose_sound: AudioStream
var max_time := 40
var timer: Timer
signal game_ended(bool)
var has_game_ended = false

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = max_time
	timer.one_shot = true
	timer.start()

func _process(delta: float) -> void:
	if get_percentage_complete() == 1 and !has_game_ended:
		AudioManager.play_sound_effect(win_sound)
		game_ended.emit(true)
		has_game_ended = true
		get_tree().paused = true

func get_percentage_complete() -> float:
	return (max_time - timer.time_left) / max_time

func game_over():
	AudioManager.play_sound_effect(lose_sound)
	game_ended.emit(false)
	has_game_ended = true
	get_tree().paused = true
