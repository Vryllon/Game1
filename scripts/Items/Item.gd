extends Node2D
class_name Item

static var item_list : Array[Resource] # stores the list of all discovered resources for quick access (especially for storing items)

const SPEED = 1

var item_index : int # stores the item's index in the item_list array

func _process(delta):
	try_gravitate_towards_player()

func try_gravitate_towards_player():
	# Gravitate towards the player when in the players Pickup_Range Area2D
	var player = $Area2D.get_overlapping_areas()
	if player != []:
		position = global_position.move_toward(player[0].global_position, SPEED)
		check_collected(player[0].global_position)

func check_collected(player_position):
	# Check if the item should be added to the inventory
	if (player_position - position).length() < 5:
		print_debug(item_index)
		queue_free()

