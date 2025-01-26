extends Area2D
class_name Cup

@export var liquid: Global.liquid_type = Global.liquid_type.NONE
@export var liquids_node: Node2D
@export var toppings_node: Node2D 
@export var milk_filter: Sprite2D
@export var ice_filter: Sprite2D

var topping_array = [Global.topping_type]

var has_ice = false
var has_milk = false
var has_other_topping = false

# Called when the node enters the scene tree for the first time.

func add_topping(topping: Global.topping_type):
	topping_array.append(topping)
	match topping:
		Global.topping_type.MILK:
			if has_milk == false:
				add_milk()
				has_milk = true
		Global.topping_type.ICE:
			if has_ice == false:
				add_ice()
				has_ice = true
		_:
			if has_other_topping == false:
				_enable_liquid(Global.topping_type.find_key(topping))
				has_other_topping = true
	
	
func add_liquid(liquid_base: Global.liquid_type):
	liquid = liquid_base
	_enable_liquid(Global.liquid_type.find_key(liquid_base))
	
func add_milk():
	milk_filter.visible = true
	topping_array.append(Global.topping_type.MILK)
	
func add_ice():
	ice_filter.visible = true
	topping_array.append(Global.topping_type.ICE)
	
func has_no_liquid():
	if liquid == Global.liquid_type.NONE:
		return true
	return false
	
func has_no_milk():
	if topping_array.has(Global.topping_type.MILK):
		return false
	return true
	
func has_no_ice():
	if topping_array.has(Global.topping_type.ICE):
		return false
	return true
	
func has_no_toppings():
	pass

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
