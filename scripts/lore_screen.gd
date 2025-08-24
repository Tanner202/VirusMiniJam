extends Control

const LEVEL = "res://scenes/level.tscn"

func _on_start_button_pressed() -> void:
	SceneTransition.change_scene_file(LEVEL)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
