class_name Health extends Node

@export var health := 10
signal health_changed(health)

func take_damage(damage: int):
	health -= damage
	health_changed.emit(health)
	if (health <= 0):
		get_parent().queue_free()
