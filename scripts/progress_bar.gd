extends ProgressBar

@export var level_manager: LevelManager

func _process(delta: float) -> void:
	value = level_manager.get_percentage_complete()
