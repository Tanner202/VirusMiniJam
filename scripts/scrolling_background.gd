extends ParallaxLayer

var speed = 200

func _process(delta: float) -> void:
	motion_offset.y += speed * delta
