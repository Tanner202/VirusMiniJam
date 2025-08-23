class_name Enemy extends Node2D

var target: Node2D
var speed := 200
var knockback_force := 1250

func _process(delta: float) -> void:
	if target != null:
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		var direction = (body.global_position - global_position).normalized()
		var player = body as Player
		player.add_external_velocity(direction * knockback_force)
