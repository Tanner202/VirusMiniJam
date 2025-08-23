extends Control

@export var lore_screen: Control
@onready var quit_button: Button = $QuitButton
@onready var start_button: Button = $StartButton

func _on_start_button_pressed() -> void:
	lore_screen.show()
	hide()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
