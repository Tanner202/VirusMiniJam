extends Control

@export var control_screen: Control

func _input(event: InputEvent) -> void:
	if event.is_pressed():
		control_screen.show()
