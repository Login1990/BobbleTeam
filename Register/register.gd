extends Node2D

var client = null
@onready var area = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func recieve_drink():
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	area.stop()
