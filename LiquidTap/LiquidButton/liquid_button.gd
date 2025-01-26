extends Area2D
class_name LiquidTap

@export var liquid_type: Global.liquid_type = Global.liquid_type.NONE

func get_liquid_type():
	return liquid_type
