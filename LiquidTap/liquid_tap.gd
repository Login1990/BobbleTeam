extends Node2D

@export var cup_holder: PlacableComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func pour(liquid_tap: Node):
	liquid_tap = liquid_tap as LiquidTap
	var liquid_tap_type = liquid_tap.get_liquid_type()
	var cup = cup_holder.get_item_in_placed_area() as Cup
	if cup == null:
		return
	if cup.has_no_liquid() == false:
		return
	cup.add_liquid(liquid_tap_type)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
