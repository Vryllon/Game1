extends Node
class_name GLOBAL

# Item Data

static var item_data = {
	"stick" : {"width" : 20, "height" : 2, "texture_path" : "res://art/Items/stick.tres", "recovery_amount" : 0},
	"apple" : {"width" : 30, "height" : 30, "texture_path" : "res://art/Items/apple.tres", "recovery_amount" : 20}
}

# Map Data
static var current_map : Node2D
