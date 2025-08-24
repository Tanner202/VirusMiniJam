extends Node2D

@export var spawnpoints: Array[Node2D]
@export var balloon_prefab: PackedScene
@export var payload: Node2D
var spawn_delay = 5
var timer

func _ready() -> void:
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = spawn_delay
	timer.start()
	timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	var balloon = balloon_prefab.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.global_position = spawnpoints.pick_random().global_position
	balloon.set_target(payload)
	timer.start()
	
