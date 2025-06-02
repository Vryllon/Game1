extends Interactable_Resource

func _ready():
	# Add apple to loot table
	resource_preload_array.append(preload("res://scenes/Items/Resources/Food/apple.tscn"))
	resource_chance_array.append(0.1)
	
	# Add stick to loot table
	resource_preload_array.append(preload("res://scenes/Items/Resources/stick.tscn"))
	resource_chance_array.append(0.3)
	
	#print_debug(resource_preload_array)

