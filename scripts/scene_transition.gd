extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var dissolve_rect: ColorRect = $DissolveRect

func change_scene(target: PackedScene) -> void:
	animation_player.play("dissolve")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(target)
	animation_player.play_backwards("dissolve")
