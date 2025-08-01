extends Node2D

var interactable_resource_preload = preload("res://scenes/Iteractable_Resources/Interactable_Resource.tscn")

var tree_num = 8
var boulder_num = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Sprite2D.set_self_modulate(Color(randf(),randf(),randf(),1))
	spawn_interactable_resource("rock", boulder_num)
	spawn_interactable_resource("tree", tree_num)

func spawn_interactable_resource(type, amount):
	for i in range(amount):
		var ir = interactable_resource_preload.instantiate()
		ir.position = Vector2(randi_range(100,1052), randi_range(100,548))
		ir.initialize(type)
		add_child(ir)
