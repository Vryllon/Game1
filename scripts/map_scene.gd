extends Node2D

var interactable_resource_preload = preload("res://scenes/Iteractable_Resources/Interactable_Resource.tscn")

var tree_num = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Sprite2D.set_self_modulate(Color(randf(),randf(),randf(),1))
	for i in range(tree_num):
		var tree = interactable_resource_preload.instantiate()
		tree.position = Vector2(randi_range(50,1102), randi_range(50,598))
		tree.initialize("tree")
		add_child(tree)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
