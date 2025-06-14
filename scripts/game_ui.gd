extends Node2D

var life_force_max = 100.00
var life_force = life_force_max

var gradient: Gradient

func _ready():
	gradient = $Life_Bar/Sprite2D.texture.get_gradient()

# updates the life force of the character
# returns false if <=0 and true otherwise
func update_life_force(life_delta):
	# update number
	life_force += life_delta
	# prevent overflow
	if life_force > life_force_max:
		life_force = life_force_max
	#print_debug(life_force)
	
	# update display
	if life_delta < 0:
		gradient.set_offset(0,life_force/life_force_max - 0.05)
		gradient.set_offset(1,life_force/life_force_max)
	elif life_delta > 0:
		gradient.set_offset(1,life_force/life_force_max)
		gradient.set_offset(0,life_force/life_force_max - 0.05)
	
	return life_force > 0

func test():
	print_debug("test")
