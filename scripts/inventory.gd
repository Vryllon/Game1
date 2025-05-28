extends Node2D

var inventory_slots : Array[Node2D]
var filled_slots : int
var inventory_size = 10

# Item Dragging Variables
var closest_item = null
var closest_distance = INF

func _ready():
	# Initializes inventory slots to empty
	for i in range(inventory_size):
		inventory_slots.append(null)
	filled_slots = 0

func _unhandled_key_input(event):
	if(event.is_action_released("ui_home")):
		visible = !visible

func _unhandled_input(event):
	# Choose the closest item in the inventory and set it to be dragged
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			var mouse_pos = get_global_mouse_position()
			for item in inventory_slots:
				if item:
					var distance = abs((item.position - mouse_pos).length())
					if distance < closest_distance:
						closest_distance = distance
						closest_item = item
			if closest_item: 
				closest_item.drag_selected = true
				closest_item.mouse_offset = closest_item.position - get_global_mouse_position()
		else:
			if closest_item: closest_item.drag_selected = false

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
