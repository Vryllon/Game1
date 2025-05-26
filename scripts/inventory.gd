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
	for slot in inventory_slots:
		if !slot:
			slot = item
			item.reparent(self)
			item.scale *= 4
			return true
	return false

func drop_item(item : Node2D):
	pass

func delete_item(item : Node2D):
	var slot = inventory_slots.find(item)
	if slot != -1: 
		inventory_slots[slot] = null
		item.queue_free()
