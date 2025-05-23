extends Node2D

var inventory_slots = Array[Node2D]

func _unhandled_key_input(event):
	if(event.is_action_released("ui_home")):
		visible = !visible
