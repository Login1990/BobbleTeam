extends Sprite2D

@onready var text = $RichTextLabel
var speak = false
@onready var audio = $AudioStreamPlayer2D
var char_index = 0
var text_index = 0
var speak_phase = "ORDER"
var char_audio = {
	1: "res://assets/sound/Batya sound.wav",
	2: "res://assets/sound/Kiki sound.wav",
	3: "res://assets/sound/Kodi sound.wav",
	4: "res://assets/sound/Murt sound.wav"
}
var phrases = {
	0: {
		"ORDER": ["[font_size=90]Ah! A human! How refreshing.[/font_size]", "[font_size=70]Good day to you! Or… good night? Hard to say in here, isn’t it?[/font_size]",
		"[font_size=70]I’ll have your... hmm 'Boba Tea'. But, you know, no blood—fruit flavors only.[/font_size]"],
		"WRONG": ["[font_size=70]YOU KIDDING! I AM BLOOD INTOLERANCE![/font_size]"],
		"CORRECT": ["[font_size=60]IT IS THE BEST DRINK I HAD IN 300 YEARS! THANK YOU![/font_size]"]
	},
	1: {
		"ORDER": ["[font_size=90]I like penis[/font_size]","I milky[/font_size]"],
		"WRONG": ["[font_size=90]YOU KIDDING[/font_size]"],
		"CORRECT": ["[font_size=90]OH MY[/font_size]"]
	},
	2: {
		"ORDER": ["[font_size=90]I like penis[/font_size]","[font_size=90]I milky[/font_size]"],
		"WRONG": ["[font_size=90]YOU KIDDING[/font_size]"],
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
	
func set_audio(char_index):
	audio.stream = load(char_audio[char_index])

func next():
	text.clear()
	text.append_text(phrases[char_index][speak_phase][text_index])
	text.visible_characters = 0
	var tween: Tween = create_tween()
	audio.playing = true
	tween.tween_property(text, "visible_characters", text.get_total_character_count() * 2, 0.2 * text.get_total_character_count())

	text_index += 1
	if text_index == phrases[char_index][speak_phase].size():
		
		text_index = 0
	tween.finished.connect(_on_tween_finished)
	
func _on_tween_finished():
	pass
	audio.stop()
	

func _on_audio_stream_player_2d_finished() -> void:
	audio.play()
