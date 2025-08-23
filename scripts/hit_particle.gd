class_name HitParticle extends Sprite2D

var time_alive = 0.05
var scale_increase_amount = 10

func _ready() -> void:
	await get_tree().create_timer(time_alive).timeout
	queue_free()

func _process(delta: float) -> void:
	scale += Vector2(scale_increase_amount * delta, scale_increase_amount * delta)
