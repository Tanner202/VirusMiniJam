class_name HitParticle extends Sprite2D

@export var time_alive = 0.05
@export var scale_increase_amount: float = 10

func _ready() -> void:
	await get_tree().create_timer(time_alive).timeout
	queue_free()

func _process(delta: float) -> void:
	scale += Vector2(scale_increase_amount * delta, scale_increase_amount * delta)
