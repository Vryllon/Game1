extends Node2D

func _on_play_button_pressed():
	print_debug("pressed play")
	handle_play()


func handle_play():
	self.hide()
	self.process_mode = Node.PROCESS_MODE_DISABLED
	GLOBAL.start_game()
