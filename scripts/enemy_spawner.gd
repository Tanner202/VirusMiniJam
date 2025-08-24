extends Node

var basic_enemy_timer: Timer
var tank_timer: Timer
@export var enemy_prefab: PackedScene
@export var tank_enemy_prefab: PackedScene
@export var spawnpoints: Array[Node2D]
@export var enemy_target: Node2D
@export var level_manager: LevelManager
var time_elapsed: float
var difficulty_stages: Array[DifficultyStage] = [
	DifficultyStage.new(10, 3.5, 0),
	DifficultyStage.new(20, 2.5, 0),
	DifficultyStage.new(30, 2.25, 12),
	DifficultyStage.new(40, 2, 10),
	DifficultyStage.new(80, 1.8, 8),
	DifficultyStage.new(120, 1.75, 7),
	DifficultyStage.new(180, 1.65, 6),
	DifficultyStage.new(240, 8, 2)
]
var game_ended = false

func _ready() -> void:
	level_manager.game_ended.connect(on_game_ended)
	basic_enemy_timer = Timer.new()
	basic_enemy_timer.one_shot = false
	basic_enemy_timer.wait_time = 4
	add_child(basic_enemy_timer)
	basic_enemy_timer.start()
	basic_enemy_timer.timeout.connect(_on_basic_enemy_timer_timeout)
	tank_timer = Timer.new()
	tank_timer.one_shot = false
	add_child(tank_timer)
	tank_timer.timeout.connect(_on_tank_timer_timeout)

func _process(delta: float) -> void:
	time_elapsed += delta
	for stage in difficulty_stages:
		if stage.end_time < time_elapsed:
			basic_enemy_timer.wait_time = stage.basic_enemy_spawn_interval
			if stage.tank_enemy_spawn_interval > 0:
				tank_timer.wait_time = stage.tank_enemy_spawn_interval
				if tank_timer.is_stopped():
					tank_timer.start()

func _on_basic_enemy_timer_timeout() -> void:
	spawn_enemy()

func _on_tank_timer_timeout() -> void:
	spawn_tank_enemy()

func spawn_enemy():
	if game_ended:
		return
	
	var spawnpoint = spawnpoints.pick_random()
	var enemy = enemy_prefab.instantiate() as Enemy
	enemy.target = enemy_target
	get_tree().current_scene.add_child(enemy)
	enemy.global_position = spawnpoint.global_position

func spawn_tank_enemy():
	if game_ended:
		return
	
	var spawnpoint = spawnpoints.pick_random()
	var enemy = tank_enemy_prefab.instantiate() as Enemy
	enemy.target = enemy_target
	get_tree().current_scene.add_child(enemy)
	enemy.global_position = spawnpoint.global_position

func on_game_ended():
	basic_enemy_timer.stop()
	tank_timer.stop()
	game_ended = true
