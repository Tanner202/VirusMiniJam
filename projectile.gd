extends Node2D

var speed := 350
var direction: Vector2

func _process(delta: float) -> void:
	global_position += direction * speed * delta
	
