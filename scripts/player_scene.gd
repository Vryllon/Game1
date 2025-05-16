extends CharacterBody2D


const SPEED = 300.0

# Signals
signal exit(exit_direction)

func _physics_process(delta):

	# handle player movement updating
	var horizontal = 0
	var vertical = 0
	horizontal = Input.get_axis("ui_left", "ui_right")
	vertical = Input.get_axis("ui_up", "ui_down")
	
	velocity = Vector2(horizontal, vertical).normalized() * SPEED

	move_and_slide()
	
	
	# Check if player is still in frame
	# Shift player to opposite edge to mimic looping to next area
	# Emit signal with exit direction for game controller to handle
	
	# exit left
	if(position.x < 0):
		position.x = 1152
		emit_signal("exit", "left")
	# exit right
	elif(position.x > 1152):
		position.x = 0
		emit_signal("exit", "right")
	# exit top
	elif(position.y < 0):
		position.y = 648
		emit_signal("exit", "top")
	# exit bottom
	elif (position.y > 648):
		position.y = 0
		emit_signal("exit", "bottom")
	
	

