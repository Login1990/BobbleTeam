extends Node2D
class_name PlacableComponent

@export var area: Area2D

var fill_color: Color = Color(1, 0, 0, 1) # Default fill color
var is_filled: bool = false
var placed_in_item: Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("highlight_placable_spots", fill_the_shape)
	Global.connect("dehighlight_placable_spots", clear_the_shape)
	Global.connect("free_other_placable_spots", free_item)

func fill_the_shape():
	if placed_in_item != null:
		return
	is_filled = true
	queue_redraw()

func clear_the_shape():
	is_filled = false
	queue_redraw()
	
func place_item(node: Node) -> void:
	var held_item = Global.get_held_item()
	print(held_item)
	if held_item != null:
		held_item.global_position = area.global_position
		placed_in_item = held_item
		Global.emit_signal("free_other_placable_spots", self)
		Global.set_held_item(null)
		area.monitoring = false
		area.monitorable = false
		
func get_item_in_placed_area():
	return placed_in_item
		
func free_item(node: Node):
	if node != self:
		area.monitoring = true
		area.monitorable = true
		placed_in_item = null
	
func _draw():
	if is_filled:
		var shape = get_collision_shape()
		if shape:
			if shape is RectangleShape2D:
				var extents = shape.extents
				draw_rect(Rect2(-extents, extents * 2), fill_color)
			elif shape is CircleShape2D:
				draw_circle(Vector2.ZERO, shape.radius, fill_color)
			else:
				push_error("Unsupported shape")
	
func get_collision_shape():
	var collision_shape = area.get_node_or_null("CollisionShape2D")
	if collision_shape and collision_shape.shape:
		return collision_shape.shape
	return null
