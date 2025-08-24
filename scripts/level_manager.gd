class_name LevelManager extends Node

var max_time := 40
var timer: Timer
signal game_ended(bool)

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = max_time
	timer.one_shot = true
	timer.start()

func _process(delta: float) -> void:
	if get_percentage_complete() == 1:
		get_tree().paused = true
		game_ended.emit(true)

func get_percentage_complete() -> float:
	return (max_time - timer.time_left) / max_time

func game_over():
	game_ended.emit(false)
	get_tree().paused = true
