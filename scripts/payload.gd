extends Node2D

@onready var health: Health = $Health

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		health.take_damage(1)
		body.queue_free()
