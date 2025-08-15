extends CharacterBody2D

static var health_modifier = 1
static var damage_modifier = 1
static var cooldown_modifier = 1
static var speed_modifier = 1

var speed = 100
var damage = 10
var atk_cooldown = 1

var health = 100

var timer = 0

func _ready():
	$AnimatedSprite2D.play("default")

func _physics_process(delta):
	timer += delta
	
	# Movement cooldown
	if timer > atk_cooldown / 4:
		navigate_to_player(delta)
	
	# Attack cooldown
	if get_slide_collision_count() > 0 && timer > atk_cooldown:
		timer = 0
		velocity = Vector2.ZERO
		damage_player()

func initialize(type):
	var data = GLOBAL.enemy_data[type]
	$AnimatedSprite2D.animation = data["texture_path"]
	health = data["health"] * health_modifier
	damage = data["damage"] * damage_modifier
	speed = data["speed"] * speed_modifier
	atk_cooldown = data["cooldown"] * cooldown_modifier

func damage_player():
	GLOBAL.update_life_force(-damage)

func update_health(delta):
	health += delta
	if health <= 0:
		self.queue_free()

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
