extends Node

@export var camera: Camera2D
@export var kitchenMusic: AudioStreamPlayer
@export var registerMusic: AudioStreamPlayer

func switch_to_left():
	camera.position.x = 0
	camera.position.y = 0
	registerMusic.volume_db = 0.0
	kitchenMusic.volume_db = -80.0

func switch_to_right():
	camera.position.x = 1920
	camera.position.y = 0
	kitchenMusic.volume_db = 0.0
	registerMusic.volume_db = -80.0
