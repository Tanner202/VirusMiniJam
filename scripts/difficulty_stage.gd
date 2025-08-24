class_name DifficultyStage

var end_time
var basic_enemy_spawn_interval
var tank_enemy_spawn_interval

func _init(end_time: float, basic_enemy_spawn_interval: float, tank_enemy_spawn_interval: float) -> void:
	self.end_time = end_time
	self.basic_enemy_spawn_interval = basic_enemy_spawn_interval
	self.tank_enemy_spawn_interval = tank_enemy_spawn_interval
