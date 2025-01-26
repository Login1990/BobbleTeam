extends Node2D

@onready var my_timer = $Timer
@onready var parent_path = get_tree().root
var char_counter = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	print("GO")
	my_timer.wait_time = 1.0
	my_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout():
	my_timer.stop()
	print("Timer has timed out!")
	spawn_character()
	char_counter += 1
	
func _on_character_left():
	spawn_character()
	char_counter += 1
	
func spawn_character():
	print()
	var character = ResourceLoader.load("res://Client/Client.tscn")
	var inst_char = character.instantiate()
	parent_path.add_child(inst_char)
	get_parent().client = inst_char
	inst_char.client_index = char_counter
	inst_char.position = Vector2(1370, 500)
	inst_char.build()
	
