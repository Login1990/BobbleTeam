extends Node
class_name ClickableComponent

@export var area: Area2D
@export var set_global_held: bool = false
##If you use it for regualar buttons - off, for "draggable" - yes

var mouse_in = false

signal clicked(node: Node)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.connect("mouse_entered", set_mouse_in)
	area.connect("mouse_exited", set_mouse_out)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT and mouse_in == true:
			emit_signal("clicked", get_parent())
			print(get_parent().name, " got clicked")
			if set_global_held:
				Global.set_held_item(get_parent())
			

func set_mouse_in():
	mouse_in = true
	
func set_mouse_out():
	mouse_in = false
