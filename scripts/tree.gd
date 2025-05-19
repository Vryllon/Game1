extends Interactable_Resource

func _ready():
	resource_preload_array.append(preload("res://scenes/stick.tscn"))
	resource_chance_array.append(1)
	#print_debug(resource_preload_array)

