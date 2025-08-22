extends Node2D

@export var weapon_sprite: Sprite2D

func _process(delta: float) -> void:
	var direction = (global_position - get_global_mouse_position()).normalized()
	rotation = direction.angle()
	if (rotation_degrees > 90 or rotation_degrees < -90):
		weapon_sprite.flip_v = true
	else:
		weapon_sprite.flip_v = false
