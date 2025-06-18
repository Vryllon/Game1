extends Item
class_name Food

var recovery_amount = 20

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed():
		if global_position.x > 1000:
			eat()

func eat():
	get_node("/root/Main/GUI").update_life_force(recovery_amount)
	get_node("/root/Main/Inventory").delete_item(self)
