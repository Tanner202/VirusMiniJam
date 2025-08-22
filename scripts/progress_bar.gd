extends ProgressBar

func _process(delta: float) -> void:
	value = Payload.get_percentage_complete()
