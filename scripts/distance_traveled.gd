extends RichTextLabel

var distance_traveled = 0

func _process(delta: float) -> void:
	distance_traveled += 50 * delta
	text = "Distance Traveled: " + str(int(distance_traveled))
