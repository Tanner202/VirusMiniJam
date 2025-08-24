extends Node2D

var target
var lifetime = 30
var float_speed = 50

func _ready() -> void:
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta: float) -> void:
	global_position.y -= float_speed * delta

func set_target(target):
	self.target = target

func _on_area_2d_body_entered(body: Node2D) -> void:
	target.get_node("Health").heal(1)
	queue_free()
