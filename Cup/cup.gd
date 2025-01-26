extends Area2D
class_name Cup

@export var liquid: Global.liquid_type = Global.liquid_type.NONE
@export var liquids_node: Node2D
@export var toppings_node: Node2D 
@export var milk_filter: Sprite2D

var topping_array = [Global.topping_type]

# Called when the node enters the scene tree for the first time.

func add_topping(topping: Global.topping_type):
	topping_array.append(topping)
	_enable_liquid(Global.topping_type.find_key(topping))
	
func add_liquid(liquid_base: Global.liquid_type):
	liquid = liquid_base
	_enable_liquid(Global.liquid_type.find_key(liquid_base))
	
func add_milk():
	milk_filter.visible = true
	
func has_no_liquid():
	if liquid == Global.liquid_type.NONE:
		return true
	return false

func _enable_liquid(overlay_name: String):
	for overlay in liquids_node.get_children():
		overlay = overlay as Node2D
		if overlay.name == overlay_name:
			overlay.visible = true

func _enable_topping(overlay_name: String):
	for overlay in toppings_node.get_children():
		overlay = overlay as Node2D
		if overlay.name == overlay_name:
			overlay.visible = true
