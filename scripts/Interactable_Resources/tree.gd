extends Interactable_Resource

func _ready():
	# Add apple to loot table
	loot_table_items.append("apple")
	loot_table_probs.append(1)
	
	# Add stick to loot table
	loot_table_items.append("stick")
	loot_table_probs.append(1)
	
	#pass

