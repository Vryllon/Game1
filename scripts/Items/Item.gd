extends Node2D
class_name Item

static var preload_dict : Dictionary # stores the list of resources of all items for quick access (especially for storing items)

const SPEED = 1
static var item_number = 0

var in_inventory = false
var recovery_amount = 0


# Mouse Drag variables
var drag_selected = false
var mouse_offset = Vector2(0,0)

func _process(delta):
	if !in_inventory:
		try_gravitate_towards_player()
	elif visible:
		follow_mouse_on_drag()

# Initialization
func initialize(name):
	var item_data = GLOBAL.item_data[name]
	if item_data:
		self.set_name(name + "|" + str(item_number))
		item_number += 1
		get_node("Sprite2D").texture = load(item_data.texture_path)
		self.transform.x = Vector2(item_data.width, 0)
		self.transform.y = Vector2(0, item_data.height)
		self.recovery_amount = item_data.recovery_amount

func set_texture(texture):
	get_node("Sprite2D").texture = texture

func follow_mouse_on_drag():
	if drag_selected:
		position = get_global_mouse_position() + mouse_offset

func try_gravitate_towards_player():
	# If inventory is full then exit the function
	if GLOBAL.inventory.is_full():
		return
	# Gravitate towards the player when in the players Pickup_Range Area2D
	var player = $Area2D.get_overlapping_areas()
	if player != []:
		position = global_position.move_toward(player[0].global_position, SPEED)
		check_if_collect(player[0].global_position)

func check_if_collect(player_position):
	# Check if the item should be added to the inventory
	if (player_position - position).length() < 5:
		#print_debug(name)
		# Add the item to the player's inventory
		if GLOBAL.inventory.add_item(self):
			in_inventory = true

func delete():
	queue_free()


# Food Handling
func eat():
	if(recovery_amount != 0):
		GLOBAL.update_life_force(recovery_amount)
		GLOBAL.inventory.delete_item(self)

