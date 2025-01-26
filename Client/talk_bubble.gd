extends Sprite2D

@onready var text = $RichTextLabel
var speak = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if speak:
		text.visible_ratio = 0
		var tween: Tween = create_tween()
		tween.tween_property(text, "visible_characters", text.get_total_character_count() * 20, 1)
		
