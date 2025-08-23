extends Node2D

@onready var health: Health = $Health

func _ready() -> void:
	health.health_changed.connect(on_health_changed)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		health.take_damage(1)
		body.queue_free()

func on_health_changed(health):
	if health <= 0:
		GameManager.game_over()
