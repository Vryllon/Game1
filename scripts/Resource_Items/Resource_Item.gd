extends Node2D
class_name Resource_Item

const SPEED = 1
var in_world = true

func _process(delta):
	if in_world:
		try_gravitate_towards_player()
		

func try_gravitate_towards_player():
	# Gravitate towards the player when in the players Pickup_Range Area2D
	var player = $Area2D.get_overlapping_areas()
	if player != []:
		position = global_position.move_toward(player[0].global_position, SPEED)

func check_collected():
	if $Area2D.get_overlapping_bodies():
		pass

