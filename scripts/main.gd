extends Node2D

func start_game():
	$Game.process_mode = Node.PROCESS_MODE_INHERIT
	$Game.show()
