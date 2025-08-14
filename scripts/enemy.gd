extends CharacterBody2D

var speed = 200.0
var damage = 20
var atk_cooldown = 1
var move_cooldown = 0.25

var timer = 0

func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	timer += delta
	
	if timer > move_cooldown:
		navigate_to_player(delta)
	
	if get_slide_collision_count() > 0 && timer > atk_cooldown:
		timer = 0
		velocity = Vector2.ZERO
		damage_player()


func damage_player():
	GLOBAL.update_life_force(-damage)

func navigate_to_player(delta):
	$NavigationAgent2D.target_position = GLOBAL.player.global_position
	if not $NavigationAgent2D.is_navigation_finished():
		var next_move_position = $NavigationAgent2D.get_next_path_position() - global_position
		velocity = next_move_position
		move(velocity)

# Adjusts the velocity to avoid obstacles
func move(v :Vector2):
	if not $NavigationAgent2D.is_navigation_finished():
		velocity = v.normalized() * speed
		rotation = v.angle()
		move_and_slide()
