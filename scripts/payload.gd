extends Node2D

@export var level_manager: LevelManager
@onready var health: Health = $Health
@export var health_sprites: Array[Sprite2D]

func _ready() -> void:
	health.health_changed.connect(on_health_changed)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		health.take_damage(1)
		var enemy = body as Enemy
		enemy.get_node("Health").take_damage(999)

func on_health_changed(health):
	var balloon_index = health - 1
	health_sprites[balloon_index].hide()
	if health <= 0:
		level_manager.game_over()
