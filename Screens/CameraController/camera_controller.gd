extends Node

@export var camera: Camera2D

func switch_to_left():
	camera.position.x = 0
	camera.position.y = 0

func switch_to_right():
	camera.position.x = 1920
	camera.position.y = 0
