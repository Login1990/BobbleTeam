extends Area2D
class_name ClientCupStand

@export var placable: PlacableComponent

func send_signal_to_client():
	print("as intented")
	var cup = placable.get_item_in_placed_area()
	Global.emit_signal("cup_placed_in_front_customer", cup)
