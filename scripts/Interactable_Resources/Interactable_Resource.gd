extends Node2D
class_name Interactable_Resource

var interactable_area : Area2D 
var loot_table_items : Array[String]
var loot_table_probs : Array[float]

var Item = preload("res://scenes/Items/item.tscn")

func Interactable_Resource(name, texture, height, width):
	initialize_interactable_resource(name, texture, height, width)

func initialize_interactable_resource(name, texture, height, width):
	self.set_name(name)
	get_node("Sprite2D").texture = texture
	self.transform.x = Vector2(width, 0)
	self.transform.y = Vector2(0, height)

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
	for i in range(loot_table_probs.size()):
		var rand = randf()
		if(rand <= loot_table_probs[i]):
			resource = Item.instantiate()
			add_child(resource)
			resource.position = position
			resource.initialize_item(loot_table_items[i])
