extends Node2D

@export var SPEED = 500
var client_index = 0
@onready var body = $Body
@onready var face = $Face
@onready var talk_bubble = $TalkBubble
var phase = "IDLE"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if phase == "WALK":
		position.x -= delta * SPEED
		position.y += 2 * sin(0.02 * position.x)
	elif phase == "TALK":
		talk_bubble.visible = true
		talk_bubble.speak = true
		print("hi i want bloody tea with eyes of murder")
	
func build():
	body.texture = load("res://assets/art/characters/body/body_%s.jpg" % client_index)
	face.texture = load("res://assets/art/characters/face/face_%s_neutral.jpg" % client_index)
	set_phase("WALK")
	
func set_phase(faza):
	phase = faza
	
func stop():
	set_phase("TALK")
