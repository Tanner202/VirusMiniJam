extends Node2D

@onready var health: Health = $Health
var max_time := 40
var timer: Timer

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = max_time
	timer.one_shot = true
	timer.start()

func get_percentage_complete() -> float:
	return (max_time - timer.time_left) / max_time

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		health.take_damage(1)
		body.queue_free()
