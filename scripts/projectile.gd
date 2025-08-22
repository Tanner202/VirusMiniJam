extends Node2D

var speed := 1000
var direction: Vector2
var damage := 3

func _process(delta: float) -> void:
	global_position += direction * speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_node("Health") and body is Enemy:
		var health = body.get_node("Health") as Health
		health.take_damage(damage)
	queue_free()
