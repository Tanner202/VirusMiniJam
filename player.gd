extends Node2D

var speed := 200

func _process(delta: float) -> void:
	if (Input.is_action_pressed("up")):
		global_position.y -= speed * delta
	if (Input.is_action_pressed("down")):
		global_position.y += speed * delta
	if (Input.is_action_pressed("right")):
		global_position.x += speed * delta
	if (Input.is_action_pressed("left")):
		global_position.x -= speed * delta
