extends Node2D

@export var hit_particle_prefab: PackedScene
var speed := 1000
var direction: Vector2
var damage := 3

func _process(delta: float) -> void:
	global_position += direction * speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_node("Health") and body is Enemy:
		var health = body.get_node("Health") as Health
		health.take_damage(damage)
	var hit_particle = hit_particle_prefab.instantiate()
	get_tree().root.add_child(hit_particle)
	hit_particle.global_position = global_position
	queue_free()
