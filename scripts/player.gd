class_name Player extends CharacterBody2D

@export var projectile_prefab: PackedScene
@export var shooting_point: Node2D
var firing_interval := 0.25
var can_shoot := true
var external_velocity = Vector2.ZERO
var external_velocity_decay = 1000
var external_velocity_magnitude_cap = 10000

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

func _process(delta: float) -> void:
	var mouse_direction = (global_position - get_global_mouse_position()).normalized()
	rotation = mouse_direction.angle()
	rotation_degrees -= 90

func shoot():
	var mouse_position = get_global_mouse_position()
	var projectile = projectile_prefab.instantiate()
	get_tree().root.add_child(projectile)
	projectile.global_position = shooting_point.global_position
	projectile.direction = (mouse_position - global_position).normalized()
	can_shoot = false
	await get_tree().create_timer(firing_interval).timeout
	can_shoot = true

func add_external_velocity(velocity: Vector2):
	external_velocity += velocity
