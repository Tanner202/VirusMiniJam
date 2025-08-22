extends Node2D

@export var projectile_prefab: PackedScene
@export var shooting_point: Node2D

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
	if (Input.is_action_just_pressed("left_click")):
		shoot()

func shoot():
	var mouse_position = get_global_mouse_position()
	var projectile = projectile_prefab.instantiate()
	get_tree().root.add_child(projectile)
	projectile.global_position = shooting_point.global_position
	projectile.direction = (mouse_position - global_position).normalized()
