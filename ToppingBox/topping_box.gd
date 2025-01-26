extends Node2D
class_name ToppingBox

@export var topping_type: Global.topping_type

func add_topping(_node: Node):
	var cup = find_cup()
	if cup == null:
		return
	cup.add_topping(topping_type)
	
func find_cup() -> Cup:
	var cup: Cup = get_tree().get_first_node_in_group("Cup")
	if cup:
		return cup
	return null 
