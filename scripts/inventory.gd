extends Node2D

var inventory_slots : Array[Node2D]
var filled_slots : int
var inventory_size = 10

# Item Dragging Variables
var closest_item = null
var closest_distance = INF
var dropped_item = null

func _ready():
	GLOBAL.inventory = self
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
					var distance = abs((item.global_position - mouse_pos).length())
					if distance < closest_distance:
						closest_distance = distance
						closest_item = item
			if closest_item: 
				closest_item.drag_selected = true
				closest_item.mouse_offset = closest_item.position - get_global_mouse_position()
		else:
			if closest_item: closest_item.drag_selected = false
			closest_distance = INF
			dropped_item = closest_item
			closest_item = null
	
	# Handle dropping items in various sections of the inventory
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed() and dropped_item:
		# Action (Eating only for now)
		if dropped_item.global_position.x > $Action.global_position.x - $Action.global_scale.x/2 and dropped_item.global_position.y > $Action.global_position.y - $Action.global_scale.y/2:
			dropped_item.eat()
		# Trash (deletes the item)
		if dropped_item.global_position.x > $Trash.global_position.x - $Trash.global_scale.x/2 and dropped_item.global_position.y < $Trash.global_position.y + $Trash.global_scale.y/2:
			delete_item(dropped_item)
		# Drop (Removes the item from the inventory and reparents it to the current map)
		if dropped_item.global_position.x > $Drop.global_position.x - $Drop.global_scale.x/2 and dropped_item.global_position.y < $Drop.global_position.y + $Drop.global_scale.y/2:
			drop_item(dropped_item)

func add_item(item : Node2D):
	# Insert the item into the first empty slot found
	for i in range(inventory_size):
		if !inventory_slots[i]:
			inventory_slots[i] = item
			filled_slots += 1
			item.reparent(self)
			item.in_inventory = true
			item.scale *= 4
			item.global_position.x = randi_range(50, get_viewport_rect().size.x / 2 - 50)
			item.global_position.y = randi_range(50, get_viewport_rect().size.y - 50)
			return true
	return false

func drop_item(item : Node2D):
	var slot = inventory_slots.find(item)
	if slot != -1:
		item.scale /= 4
		item.global_position = GLOBAL.player.global_position + Vector2(100,0)
		item.in_inventory = false
		item.reparent(GLOBAL.current_map)
		filled_slots -= 1
		inventory_slots[slot] = null
		print_debug("Drop Item")

func delete_item(item : Node2D):
	var slot = inventory_slots.find(item)
	if slot != -1: 
		inventory_slots[slot] = null
		item.delete()
		print_debug("Delete Item")
		filled_slots -= 1

func search_item(name):
	for i in inventory_slots:
		if i != null and i.name.split("|")[0] == name:
			return i

func is_full():
	return filled_slots >= inventory_size
