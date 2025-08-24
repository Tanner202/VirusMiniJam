extends Node

@onready var timer: Timer = $Timer
@export var enemy_prefab: PackedScene
@export var spawnpoints: Array[Node2D]
@export var enemy_target: Node2D
var time_elapsed: float
var difficulty_stages: Array[DifficultyStage] = [
	DifficultyStage.new(5, 3),
	DifficultyStage.new(10, 2.5),
	DifficultyStage.new(20, 1.9),
	DifficultyStage.new(30, 1.75),
	DifficultyStage.new(35, 1.5)
]
var spawn_interval = 4

func _process(delta: float) -> void:
	time_elapsed += delta
	for stage in difficulty_stages:
		if stage.end_time < time_elapsed:
			spawn_interval = stage.enemy_spawn_speed

func _on_timer_timeout() -> void:
	spawn_enemy()
	timer.start(spawn_interval)

func spawn_enemy():
	var spawnpoint = spawnpoints.pick_random()
	var enemy = enemy_prefab.instantiate() as Enemy
	enemy.target = enemy_target
	get_tree().root.add_child(enemy)
	enemy.global_position = spawnpoint.global_position
