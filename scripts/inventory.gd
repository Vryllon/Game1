extends Node2D

var inventory_slots : Array[String]

func _ready():
	# Initializes 10 inventory slots to empty
	inventory_slots = ["","","","","","","","","",""]

func _unhandled_key_input(event):
	if(event.is_action_released("ui_home")):
		visible = !visible

func add_item(item : String):
	pass

func drop_item(item : String):
	pass

func trash_item(item : String):
	pass
