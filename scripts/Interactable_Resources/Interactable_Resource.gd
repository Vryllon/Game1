extends Node2D
class_name Interactable_Resource

var interactable_area : Area2D 
var resource_preload_array : Array[Resource]
var resource_chance_array : Array[float]

func _draw():
	interactable_area = find_child("Interactable_Area")

func _process(delta):
	if(interactable_area.get_overlapping_bodies() != [] and Input.is_action_just_released("ui_accept")):
		interact()

func interact():
	#print_debug("Interact")
	drop_resources()

func drop_resources():
	var resource
	for i in range(resource_chance_array.size()):
		var rand = randf()
		if(rand <= resource_chance_array[i]):
			resource = resource_preload_array[i].instantiate()
			add_child(resource)
			resource.position = position
			print_debug(resource.position)
