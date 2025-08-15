extends Node2D

var interactable_resource_preload = load("res://scenes/Iteractable_Resources/Interactable_Resource.tscn")
var enemy_preload = load("res://scenes/enemy.tscn")

var tree_num = 8
var boulder_num = 2
var enemy_num = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Sprite2D.set_self_modulate(Color(randf(),randf(),randf(),1))
	spawn_interactable_resource("rock", boulder_num)
	spawn_interactable_resource("tree", tree_num)
	spawn_enemy("hawk", enemy_num)

func spawn_interactable_resource(type, amount):
	for i in range(amount):
		var ir = interactable_resource_preload.instantiate()
		set_random_position(ir)
		ir.initialize(type)
		$NavigationRegion2D.add_child(ir)

func spawn_enemy(type, amount):
	for i in range(amount):
		var enemy = enemy_preload.instantiate()
		set_random_position(enemy)
		enemy.initialize(type)
		$NavigationRegion2D.add_child(enemy)

func set_random_position(object):
	object.position = Vector2(randi_range(100,1052), randi_range(100,548))
