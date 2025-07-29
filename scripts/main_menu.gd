extends Node2D



func _on_play_button_pressed():
	handle_play()

func handle_play():
	get_parent().start_game()
	self.hide()
	self.process_mode = Node.PROCESS_MODE_DISABLED
	
