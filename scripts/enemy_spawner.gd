extends Node

@onready var timer: Timer = $Timer
@export var enemy_prefab: PackedScene
@export var spawnpoints: Array[Node2D]
@export var enemy_target: Node2D
var spawn_interval = 4

func _on_timer_timeout() -> void:
	spawn_enemy()
	timer.start(spawn_interval)

func spawn_enemy():
	var spawnpoint = spawnpoints.pick_random()
	var enemy = enemy_prefab.instantiate() as Enemy
	enemy.target = enemy_target
	get_tree().root.add_child(enemy)
	enemy.global_position = spawnpoint.global_position
