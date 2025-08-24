class_name Health extends Node

@export var max_health := 10
@onready var health = max_health
signal health_changed(health)
signal health_gained(health)

func take_damage(damage: int):
	health -= damage
	health_changed.emit(health)
	if (health <= 0):
		get_parent().queue_free()

func heal(amount):
	if health + amount <= max_health:
		health += amount
		health_gained.emit(health)
	else:
		health = max_health
