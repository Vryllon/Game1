extends Node2D

func _ready():
	GLOBAL.main = self

func instantiate_scene(scene):
	add_child(scene.instantiate())
