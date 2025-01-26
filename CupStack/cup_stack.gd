extends Node2D
class_name CupStack

@export var spawn_platform: PlacableComponent
@export var packed_cup: PackedScene

func spawn_cup(_node: Node):
	if other_cups_dont_exist():
		var cup = packed_cup.instantiate()
		get_tree().root.add_child(cup)
		spawn_platform.spawn_in_item(cup)
		disable_clickable_on_placable()
	
func other_cups_dont_exist():
	if get_tree().get_node_count_in_group("Cup") == 0:
		return true
	return false
	
## If spawned programatically, still remains clickable which fucks up input, crutch
func disable_clickable_on_placable():
	for sibling in spawn_platform.get_parent().get_children():
		if sibling is ClickableComponent:
			sibling.disabled = true
