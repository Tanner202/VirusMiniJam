extends CharacterBody2D

@export var projectile_prefab: PackedScene
@export var shooting_point: Node2D

var speed := 400

func _process(delta: float) -> void:
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
		
	if (Input.is_action_just_pressed("left_click")):
		shoot()
	
	velocity = direction * speed
	move_and_slide()

func shoot():
	var mouse_position = get_global_mouse_position()
	var projectile = projectile_prefab.instantiate()
	get_tree().root.add_child(projectile)
	projectile.global_position = shooting_point.global_position
	projectile.direction = (mouse_position - global_position).normalized()
