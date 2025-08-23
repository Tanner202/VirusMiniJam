extends ProgressBar

func _process(delta: float) -> void:
	value = GameManager.get_percentage_complete()
