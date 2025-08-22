class_name Enemy extends Node2D

@export var target: Node2D
var speed := 200

func _process(delta: float) -> void:
	if target != null:
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * speed * delta
