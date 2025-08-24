extends Control

@export var scene: PackedScene
@export var main_menu: PackedScene
@export var level_manager: LevelManager
@export var game_over_ui: Control
@onready var distance_traveled_result: RichTextLabel = $GameOverUI/DistanceTraveledResult
@onready var button: Button = $GameOverUI/Button
@onready var button_2: Button = $GameOverUI/Button2
@onready var distance_traveled: RichTextLabel = $"../DistanceTraveled"

func _ready() -> void:
	level_manager.game_ended.connect(on_game_ended)

func on_game_ended(win: bool):
	game_over_ui.show()
	distance_traveled_result.text = distance_traveled.text

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_button_2_pressed() -> void:
	SceneTransition.change_scene(main_menu)
	get_tree().paused = false
