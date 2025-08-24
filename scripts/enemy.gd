class_name Enemy extends Node2D

var target: Node2D
@export var speed := 200
@export var knockback_force := 1250
@export var explosion_particle_prefab: PackedScene
@onready var health: Health = $Health

func _ready() -> void:
	health.health_changed.connect(on_health_changed)

func _process(delta: float) -> void:
	if target != null:
		var direction = (target.global_position - global_position).normalized()
		global_position += direction * speed * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		var direction = (body.global_position - global_position).normalized()
		var player = body as Player
		player.knockback(direction * knockback_force)

func on_health_changed(health):
	if health <= 0:
		var explosion_particles = explosion_particle_prefab.instantiate()
		get_tree().root.add_child(explosion_particles)
		explosion_particles.global_position = global_position
		explosion_particles.emitting = true
