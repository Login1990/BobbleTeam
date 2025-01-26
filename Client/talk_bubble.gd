extends Sprite2D

@onready var text = $RichTextLabel
var speak = false
var char_index = 0
var text_index = 0
var speak_phase = "ORDER"
var phrases = {
	0: {
		"ORDER": ["[font_size=90]I like penis[/font_size]","[font_size=90]I milky[/font_size]"],
		"NO MILK": ["[font_size=90]YOU KIDDING[/font_size]"],
		"CORRECT": ["[font_size=90]OH MY[/font_size]"]
	},
	1: {
		"ORDER": ["[font_size=90]I like penis[/font_size]","I milky[/font_size]"],
		"NO BLOOD": ["[font_size=90]YOU KIDDING[/font_size]"],
		"CORRECT": ["[font_size=90]OH MY[/font_size]"]
	},
	2: {
		"ORDER": ["[font_size=90]I like penis[/font_size]","[font_size=90]I milky[/font_size]"],
		"NO MILK": ["[font_size=90]YOU KIDDING[/font_size]"],
		"CORRECT": ["[font_size=90]OH MY[/font_size]"]
	}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if speak:
		#text.visible_ratio = 0
		#var tween: Tween = create_tween()
		#tween.tween_property(text, "visible_characters", text.get_total_character_count(), 0.01 * text.get_total_character_count())
		
func set_speak_phase(phase: int):	
	speak_phase = phase	
	text_index = 0

func next():
	text.clear()
	text.append_text(phrases[char_index][speak_phase][text_index])
	text.visible_characters = 0
	var tween: Tween = create_tween()
	tween.tween_property(text, "visible_characters", text.get_total_character_count(), 0.01 * text.get_total_character_count())
	text_index += 1
	if text_index == phrases[char_index][speak_phase].size():
		text_index = 0
	
