extends Node2D

var gradient: Gradient

func _ready():
	gradient = $Life_Bar/Sprite2D.texture.get_gradient()
	GLOBAL.GUI = self

func update_life_display():
	# update display
	var life_fraction = GLOBAL.life_force/GLOBAL.life_force_max
	if life_fraction - gradient.get_offset(1) < 0:
		gradient.set_offset(0,life_fraction - 0.05)
		gradient.set_offset(1,life_fraction)
	else:
		gradient.set_offset(1,life_fraction)
		gradient.set_offset(0,life_fraction - 0.05)
	print_debug(gradient.offsets)

func test():
	print_debug("test")
