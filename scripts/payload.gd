extends Node2D

@export var level_manager: LevelManager
@onready var health: Health = $Health
@export var health_sprites: Array[Sprite2D]

func _ready() -> void:
	health.health_changed.connect(on_health_changed)
	health.health_gained.connect(on_health_gained)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		health.take_damage(1)
		var enemy = body as Enemy
		enemy.get_node("Health").take_damage(999)

func on_health_changed(amount):
	var balloon_index = amount - 1
	health_sprites[balloon_index].hide()
	if amount <= 0:
		level_manager.game_over()

func on_health_gained(amount):
	var balloon_index = amount - 2
	print(balloon_index)
	health_sprites[balloon_index].show()
