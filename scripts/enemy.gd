extends CharacterBody2D

var speed = 200.0

func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	navigate_to_player(delta)

func navigate_to_player(delta):
	# set target position to the player position
	$NavigationAgent2D.target_position = GLOBAL.player.global_position
	
	# get the next position to navigate to to get to the player
	var navigation_position = $NavigationAgent2D.get_next_path_position()
	
	# set velocity in the direction of the target position
	velocity = (navigation_position - global_position).normalized() * speed
	move_and_slide()
