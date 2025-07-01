extends Node
class_name GLOBAL

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

static var life_force_max = 100
static var life_force = life_force_max
