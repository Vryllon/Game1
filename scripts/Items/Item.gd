extends Node2D
class_name Item

static var preload_dict : Dictionary # stores the list of resources of all items for quick access (especially for storing items)

const SPEED = 1

var in_inventory = false

func _ready():
	# Initialize item list preloads
	preload_dict = {
		"Stick" : preload("res://scenes/Items/Resources/stick.tscn")
	}

func _process(delta):
	if !in_inventory:
		try_gravitate_towards_player()

func try_gravitate_towards_player():
	# If inventory is full then exit the function
	if get_node("/root/Main/Inventory").is_full():
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
		if get_node("/root/Main/Inventory").add_item(self):
			in_inventory = true

