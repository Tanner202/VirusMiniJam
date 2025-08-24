extends Node

@export var hover_sound: AudioStream
@export var click_sound: AudioStream

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("UIButtons"):
		button.mouse_entered.connect(on_mouse_entered)
		button.pressed.connect(on_button_pressed)

func on_mouse_entered():
	AudioManager.play_ui_sound(hover_sound)

func on_button_pressed():
	AudioManager.play_ui_sound(click_sound)
