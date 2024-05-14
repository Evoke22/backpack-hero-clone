extends Area2D

signal position_empty

func _process(delta):
	var overlapping_bodies = self.get_overlapping_bodies()
	if overlapping_bodies.is_empty():
		position_empty.emit()
