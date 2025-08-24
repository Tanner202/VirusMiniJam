extends Sprite2D

var speed = 100

func _process(delta: float) -> void:
	global_position.y += speed * delta
