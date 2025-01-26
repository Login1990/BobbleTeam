extends Node

signal highlight_placable_spots
signal dehighlight_placable_spots
signal free_other_placable_spots(node: Node)
#Placable spot keep reference to item held within, so when we move it,
#we basically tell all other placable components to clear that reference
signal re_enable_clickable

enum liquid_type {
	ENERGY_DRINK,
	BLOOD,
	ACID,
	COFFEE,
	NONE
}

enum topping_type {
	EYES,
	TEETH,
	ICE
}

var held_item: Node :
	set(value):
		if value != null:
			emit_signal("highlight_placable_spots")
		elif value == null:
			emit_signal("dehighlight_placable_spots")
		held_item = value
	get:
		return held_item

func set_held_item(node: Node):
	held_item = node
	
func get_held_item():
	return held_item
