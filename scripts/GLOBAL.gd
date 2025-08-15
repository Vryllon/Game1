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

static func end_game():
	print_debug("End Game")
	game.process_mode = PROCESS_MODE_DISABLED
	game.hide()
	main.get_node("GameOverScreen").show()
	main.get_node("GameOverScreen").process_mode = PROCESS_MODE_INHERIT
	game.queue_free()
	game = null
	current_map = null
	player.life_force_max = player.life_force_default
	player.life_force = player.life_force_max

# Item Data

static var item_data = {
	"stick" : {"width" : 20, "height" : 20, "texture_path" : "res://art/Items/stick.tres", "recovery_amount" : 0},
	"apple" : {"width" : 30, "height" : 30, "texture_path" : "res://art/Items/apple.tres", "recovery_amount" : 20},
	"stone" : {"width" : 20, "height" : 20, "texture_path" : "res://art/Items/stone.tres", "recovery_amount" : 0},
	"tool" : {"width" : 30, "height" : 30, "texture_path" : "res://art/Items/tool.tres", "recovery_amount" : -50}
}


# Interactable Resource Data

static var interactable_resource_data = {
	"tree" : {"width" : 100, "height" : 100, "texture_path" : "res://art/Interactable_Resources/tree.tres", "loot_table" : [["stick", 1], ["apple", 1]]},
	"rock" : {"width" : 80, "height" : 80, "texture_path" : "res://art/Interactable_Resources/rock.tres", "loot_table" : [["stone", 1]]}
}


# Enemy Data

static var enemy_data = {
	"hawk" : {"texture_path" : "res://art/Enemy/Enemy_idle.tres", "health" : 100, "damage" : 20, "cooldown" : 1, "speed" : 200}
}


# Map Data

static var current_map : Node2D


