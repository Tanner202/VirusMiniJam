extends Sprite2D

var og_position
var speed = 200

func _ready() -> void:
	og_position = global_position

func _process(delta: float) -> void:
	global_position.y += speed * delta
	if global_position.y > 5000:
		global_position = og_position
