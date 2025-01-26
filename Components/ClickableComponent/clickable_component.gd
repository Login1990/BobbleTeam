extends Node
class_name ClickableComponent

@export var area: Area2D
@export var set_global_held: bool = false
##If you use it for regualar buttons - off, for "draggable" - yes
@export var click_type: clickable_type = clickable_type.ETC
@export var disabled: bool = false

enum clickable_type {ETC, CUP, CUP_SPOT}

var mouse_in = false

signal clicked(node: Node)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("re_enable_clickable", enable_clickable)
	area.connect("mouse_entered", set_mouse_in)
	area.connect("mouse_exited", set_mouse_out)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and mouse_in == true:
			if disabled == false:
				emit_signal("clicked", get_parent())
				print(get_parent().name, " got clicked")
				if set_global_held:
					Global.set_held_item(get_parent())
				if click_type == clickable_type.CUP_SPOT:
					Global.emit_signal("re_enable_clickable")
					disabled = true
			
func enable_clickable():
	disabled = false

func set_mouse_in():
	mouse_in = true
	
func set_mouse_out():
	mouse_in = false
