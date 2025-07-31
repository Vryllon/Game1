extends Node2D
class_name Interactable_Resource

var interactable_area : Area2D 

var Item = load("res://scenes/Items/item.tscn")
var Name

# Initialization
func initialize(name):
	var interactable_resource_data = GLOBAL.interactable_resource_data[name]
	if interactable_resource_data:
		Name = name
		self.set_name(name)
		get_node("Sprite2D").texture = load(interactable_resource_data.texture_path)
		self.transform.x = Vector2(interactable_resource_data.width, 0)
		self.transform.y = Vector2(0, interactable_resource_data.height)

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
	var loot_table_data = GLOBAL.interactable_resource_data[Name]["loot_table"]
	for i in range(loot_table_data.size()):
		var rand = randf()
		if(rand <= loot_table_data[i][1]):
			resource = Item.instantiate()
			add_child(resource)
			resource.position = position
			resource.initialize(loot_table_data[i][0])
