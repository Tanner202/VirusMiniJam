class_name Player extends CharacterBody2D

@export var projectile_prefab: PackedScene
@export var shooting_point: Node2D
@export var ship_sprite: AnimatedSprite2D
@export var hit_particle_prefab: PackedScene
@export var move_particle_prefab: PackedScene
@onready var move_particle_position: Node2D = $MoveParticles
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var firing_interval := 0.25
var can_shoot := true
var external_velocity = Vector2.ZERO
var external_velocity_decay = 1000
var external_velocity_magnitude_cap = 10000
var hit_duration = 0.1

var speed := 400

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction.y = -1
	if Input.is_action_pressed("down"):
		direction.y = 1
	if Input.is_action_pressed("up") and Input.is_action_pressed("down"):
		direction.y = 0
		
	if Input.is_action_pressed("left"):
		direction.x = -1
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		direction.x = 0
		
	if Input.is_action_just_pressed("left_click") and can_shoot:
		shoot()
	
	velocity = direction * speed + external_velocity
	external_velocity = external_velocity.move_toward(Vector2.ZERO, external_velocity_decay * delta)
	move_and_slide()
	if direction != Vector2.ZERO:
		gpu_particles_2d.emitting = true
	else:
		gpu_particles_2d.emitting = false

func _process(delta: float) -> void:
	var mouse_direction = (global_position - get_global_mouse_position()).normalized()
	rotation = mouse_direction.angle()
	rotation_degrees -= 90

func shoot():
	audio_stream_player_2d.play()
	var mouse_position = get_global_mouse_position()
	var projectile = projectile_prefab.instantiate()
	get_tree().root.add_child(projectile)
	projectile.global_position = shooting_point.global_position
	projectile.direction = (mouse_position - global_position).normalized()
	can_shoot = false
	await get_tree().create_timer(firing_interval).timeout
	can_shoot = true

func knockback(velocity: Vector2):
	external_velocity += velocity
	var hit_particle = hit_particle_prefab.instantiate()
	get_tree().root.add_child(hit_particle)
	hit_particle.global_position = global_position
	ship_sprite.play("hit")
	await get_tree().create_timer(hit_duration).timeout
	ship_sprite.play("default")
	
