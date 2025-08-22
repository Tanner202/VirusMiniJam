class_name Health extends Node

@export var health := 10

func take_damage(damage: int):
	health -= damage
	if (health <= 0):
		get_parent().queue_free()
