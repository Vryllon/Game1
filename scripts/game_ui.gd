extends Node2D

var gradient: Gradient

func _ready():
	gradient = $Life_Bar/Sprite2D.texture.get_gradient()

# updates the life force of the character
# returns false if <=0 and true otherwise
func update_life_force(life_delta):
	# update number
	GLOBAL.life_force += life_delta
	# prevent overflow
	if GLOBAL.life_force > GLOBAL.life_force_max:
		GLOBAL.life_force = GLOBAL.life_force_max
	#print_debug(GLOBAL.life_force)
	
	# update display
	if life_delta < 0:
		gradient.set_offset(0,GLOBAL.life_force/GLOBAL.life_force_max - 0.05)
		gradient.set_offset(1,GLOBAL.life_force/GLOBAL.life_force_max)
	elif life_delta > 0:
		gradient.set_offset(1,GLOBAL.life_force/GLOBAL.life_force_max)
		gradient.set_offset(0,GLOBAL.life_force/GLOBAL.life_force_max - 0.05)
	
	return GLOBAL.life_force > 0

func test():
	print_debug("test")
