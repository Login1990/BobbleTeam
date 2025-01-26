extends Node2D

var client = null
@onready var area = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.connect("cup_placed_in_front_customer", recieve_drink)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func recieve_drink(drink:Cup):
	if client:
		print(drink.toppings_node)
		client.recieve_drink(drink)
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	area.stop()
