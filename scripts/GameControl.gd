extends Node2D

var map_grid: Array[Node2D]
var map_scene_preload = load("res://scenes/map_scene.tscn")

func _ready():
	
	GLOBAL.game = get_parent()
	
	# Setup map grid
	for i in range(9):
		map_grid.append(null)
	map_grid[4] = get_parent().get_node("map_scene")
	
	# set global current map variable
	GLOBAL.current_map = map_grid[4]

func _on_player_scene_exit(exit_direction):
	#print_debug(exit_direction)
	handle_map_change(exit_direction)
	#$GUI.get_script().update_life_force(-20)
	if !GLOBAL.update_life_force(-20):
		GLOBAL.end_game()

func handle_map_change(exit_direction):
	# Handle changing map
	
	var previous_map = map_grid[4]
	print_debug(exit_direction)
	# left
	if(exit_direction == "right"):
		for i in range(3):
			if(map_grid[i*3]): map_grid[i*3].queue_free()
			map_grid[i*3] = map_grid[i*3+1]
			map_grid[i*3+1] = map_grid[i*3+2]
			map_grid[i*3+2] = null
	# right
	elif(exit_direction == "left"):
		for i in range(3):
			if(map_grid[i*3+2]): map_grid[i*3+2].queue_free()
			map_grid[i*3+2] = map_grid[i*3+1]
			map_grid[i*3+1] = map_grid[i*3]
			map_grid[i*3] = null
	# top
	elif(exit_direction == "top"):
		#print_debug("exit top")
		for i in range(3):
			if(map_grid[i+6]): map_grid[i+6].queue_free()
			map_grid[i+6] = map_grid[i+3]
			map_grid[i+3] = map_grid[i]
			map_grid[i] = null
			
	# bottom
	elif(exit_direction == "bottom"):
		for i in range(3):
			if(map_grid[i]): map_grid[i].queue_free()
			map_grid[i] = map_grid[i+3]
			map_grid[i+3] = map_grid[i+6]
			map_grid[i+6] = null
	
	# Show map for moved position
	if(map_grid[4]):
		map_grid[4].show()
		map_grid[4].process_mode = Node.PROCESS_MODE_INHERIT
	else:
		map_grid[4] = map_scene_preload.instantiate()
		add_sibling(map_grid[4])
	
	# set global current map variable
	GLOBAL.current_map = map_grid[4]
	
	# hide previous map
	previous_map.hide()
	previous_map.process_mode = Node.PROCESS_MODE_DISABLED
	
	# print map array
	# print_debug(map_grid)

