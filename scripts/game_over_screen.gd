extends Node2D



func _on_play_button_pressed():
	handle_play()

func handle_play():
	self.hide()
	self.process_mode = Node.PROCESS_MODE_DISABLED
	GLOBAL.start_game()


func _on_main_menu_pressed():
	handle_menu()

func handle_menu():
	self.hide()
	GLOBAL.main.get_node("MainMenu").show()
	GLOBAL.main.get_node("MainMenu").process_mode = PROCESS_MODE_INHERIT

