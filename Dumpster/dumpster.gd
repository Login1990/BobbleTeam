extends Node2D
class_name Dumpster

func dump(_node: Node):
	var held_item = Global.get_held_item()
	if held_item is Cup:
		held_item.queue_free()
		Global.emit_signal("dehighlight_placable_spots")
