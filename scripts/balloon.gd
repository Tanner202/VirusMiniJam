extends Node2D

var target

func set_target(target):
	self.target = target

func _on_area_2d_body_entered(body: Node2D) -> void:
	target.get_node("Health").heal(1)
	queue_free()
