extends Node2D

var inventory_slots : int

func _unhandled_key_input(event):
	if(event.is_action_released("ui_home")):
		visible = !visible

func add_item(item : int):
	pass

func drop_item(item : int):
	pass

func trash_item(item : int):
	pass
