
signal highlight_placable_spots

var held_item: Node :
	set(value):
		if value != null:
			emit_signal("highlight_placable_spots")

func set_held_item(node: Node):
	held_item = node
