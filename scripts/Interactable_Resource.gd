extends Node2D
class_name Interactable_Resource

var interactable_area : Area2D 
var resource_preload_array : Array[ResourcePreloader]
var resource_chance_array : Array[float]

func _draw():
	interactable_area = find_child("Interactable_Area")

func _process(delta):
	if(interactable_area.get_overlapping_bodies() != [] and Input.is_action_just_released("ui_accept")):
		interact()

func interact():
	print_debug("Interact")

func drop_resources():
	var rand = randf()
	for i in range(resource_chance_array.size()):
		if(rand <= resource_chance_array[i]):
			resource_preload_array[i].instantiate()
