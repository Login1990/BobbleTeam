extends Node2D

@export var SPEED = 500
var client_index = 0
@onready var body = $Body
@onready var face = $Face
@onready var talk_bubble = $TalkBubble
var phase = "IDLE"
var drinks = {
	1: 0,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func recieve_drink(drink):
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if phase == "WALK":
		position.x -= delta * SPEED
		position.y += 2 * sin(0.02 * position.x)
	elif phase == "TALK":
		pass
		
	
func build():
	body.texture = load("res://assets/art/characters/body/body_%s.png" % client_index)
	face.texture = load("res://assets/art/characters/face/face_%s_neutral.png" % client_index)
	talk_bubble.set_audio(client_index)
	set_phase("WALK")
	
func set_phase(faza):
	phase = faza
	
func stop():
	set_phase("TALK")
	talk_bubble.visible = true
	talk_bubble.speak = true
	talk_bubble.next()

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if phase == "TALK" and event is InputEventMouseButton and event.pressed:
		talk_bubble.next()
