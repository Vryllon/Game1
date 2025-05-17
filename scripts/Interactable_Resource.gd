extends Node2D
class_name Interactable_Resource

var interactable_area : Area2D 

func _draw():
	interactable_area = find_child("Interactable_Area")

func _process(delta):
	if(interactable_area.get_overlapping_bodies() != [] and Input.is_action_just_released("ui_accept")):
		interact()

func interact():
	print_debug("Interact")
