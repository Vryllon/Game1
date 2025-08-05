extends Node2D


var Item = load("res://scenes/Items/item.tscn")


# Crafting Functions

func craft():
	#print_debug("craft")
	# Gather ingredients in the crafting area
	var ingredients = get_areas_in_crafting()
	
	# Check what recipe is being crafted
	var recipe = ingredients_to_recipe(ingredients)
	print_debug(recipe)
	
	if recipe != null: 
		# Remove the ingredients used to craft the recipe
		remove_used_ingredients(crafting_recipes[recipe])
		
		# Create the crafted item in the inventory
		var item = Item.instantiate()
		add_child(item)
		item.initialize(recipe)
		get_parent().add_item(item)


func ingredients_to_recipe(ingredients : Array):
	for r in crafting_recipes:
		var recipe_requirements = []
		recipe_requirements.append_array(crafting_recipes[r])
		for i in ingredients:
			if array_contains_string(recipe_requirements,i):
				recipe_requirements.erase(i)
			#print_debug("recipe requirements = " + str(recipe_requirements))
		if(recipe_requirements == []):
			return r


func array_contains_string(array, string):
	for s in array:
		#print_debug(s + " == " + string + " ?")
		if s == string : return true
	return false


func remove_used_ingredients(recipe):
	var ingredients = $Area2D.get_overlapping_areas()
	
	for i in recipe:
		# Search for ingredient
		for ingredient in ingredients:
			if(i == ingredient.get_parent().name.split("|")[0]):
				# removes ingredient from inventory
				get_parent().delete_item(ingredient.get_parent())
				break
		


func get_areas_in_crafting():
	var ingredients = []
	var ingredients_areas = $Area2D.get_overlapping_areas()
	for i in ingredients_areas:
		ingredients.append(i.get_parent().name.split("|")[0])
	#print_debug("ingredients = " + str(ingredients))
	return ingredients


# Crafting Recipes

static var crafting_recipes = {
	"tool" : ["stick", "stone"]
}


# Button Connection
func _on_button_pressed():
	#print_debug("pressed")
	craft()
