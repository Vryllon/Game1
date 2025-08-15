extends Node2D

var lifebar: TextureProgressBar

func _ready():
	lifebar = $Life_Bar/TextureProgressBar
	GLOBAL.GUI = self

func update_life_display():
	# update display
	lifebar.max_value = GLOBAL.player.life_force_max
	lifebar.value = GLOBAL.player.life_force
	

func test():
	print_debug("test")
