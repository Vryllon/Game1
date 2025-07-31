extends Node
class_name GLOBAL

static var GUI : Node2D

# Preloads

static var game_preload = load("res://scenes/game.tscn")

# Important Nodes

static var main
static var game
static var player
static var inventory



# Game Functions

static func start_game():
	print_debug("Start Game Loading")
	main.instantiate_scene(game_preload)
	print_debug("Finished Game Loading")
	main.print_tree()

static func end_game():
	print_debug("End Game")
	game.process_mode = PROCESS_MODE_DISABLED
	game.hide()
	main.get_node("GameOverScreen").show()
	game.queue_free()
	game = null
	current_map = null
	life_force_max = life_force_default
	life_force = life_force_max

# Item Data

static var item_data = {
	"stick" : {"width" : 20, "height" : 20, "texture_path" : "res://art/Items/stick.tres", "recovery_amount" : 0},
	"apple" : {"width" : 30, "height" : 30, "texture_path" : "res://art/Items/apple.tres", "recovery_amount" : 20}
}


# Interactable Resource Data

static var interactable_resource_data = {
	"tree" : {"width" : 100, "height" : 100, "texture_path" : "res://art/Interactable_Resources/tree.tres", "loot_table" : [["stick", 1], ["apple", 1]]}
}


# Map Data

static var current_map : Node2D


# Player Data

static var life_force_default = 100
static var life_force_max = life_force_default
static var life_force = life_force_max

# updates the life force of the character
# returns false if <=0 and true otherwise
static func update_life_force(life_delta):
	# update number
	GLOBAL.life_force += life_delta
	# prevent overflow
	if life_force > life_force_max:
		life_force = life_force_max
	print_debug(life_force)
	
	# Update GUI
	if GUI: GUI.update_life_display()
	
	return life_force > 0
