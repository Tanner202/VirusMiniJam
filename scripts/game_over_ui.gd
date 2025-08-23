extends Control

@export var victory_image: TextureRect
@export var game_over_image: TextureRect

func _ready() -> void:
	GameManager.game_ended.connect(on_game_ended)

func on_game_ended(win: bool):
	if win:
		victory_image.show()
	else:
		game_over_image.show()
