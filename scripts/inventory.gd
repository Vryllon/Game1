extends Node2D

var inventory_slots : Array[Node2D]
var filled_slots : int
var inventory_size = 10

func _ready():
	# Initializes inventory slots to empty
	for i in range(inventory_size):
		inventory_slots.append(null)
	filled_slots = 0

func _unhandled_key_input(event):
	if(event.is_action_released("ui_home")):
		visible = !visible

func add_item(item : Node2D):
	# Insert the item into the first empty slot found
	for i in range(inventory_size):
		if !inventory_slots[i]:
			inventory_slots[i] = item
			filled_slots += 1
			item.reparent(self)
			item.scale *= 4
			item.global_position.x = randi_range(50, get_viewport_rect().size.x / 2 - 50)
			item.global_position.y = randi_range(50, get_viewport_rect().size.y - 50)
			return true
	return false

func drop_item(item : Node2D):
	pass

func delete_item(item : Node2D):
	var slot = inventory_slots.find(item)
	if slot != -1: 
		inventory_slots[slot] = null
		item.queue_free()

func is_full():
	return filled_slots >= inventory_size
