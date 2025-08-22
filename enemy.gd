extends Node2D

@export var target: Node2D
var speed := 200

func _process(delta: float) -> void:
	var direction = (target.global_position - global_position).normalized()
	global_position += direction * speed * delta
