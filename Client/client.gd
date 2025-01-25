extends Node2D

var SPEED = 2
var client_index = 0
@onready var body = $Body
@onready var face = $Face
var walk = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if walk:
		print("WALK")
		position.x -= SPEED
		position.y += 0.7 * sin(0.015 * position.x)
	
func build():
	body.texture = load("res://assets/art/characters/body/body_%s.jpg" % client_index)
	face.texture = load("res://assets/art/characters/face/face_%s_neutral.jpg" % client_index)
	set_walk(true)

func set_walk(boolean):
	walk = boolean
