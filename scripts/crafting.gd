extends Node2D


# Crafting Functions

func craft():
	#print_debug("craft")
	var ingredients = []
	var ingredients_areas = $Area2D.get_overlapping_areas()
	for i in ingredients_areas:
		ingredients.append(i.get_parent().name.split("|")[0])
	print_debug("ingredients = " + str(ingredients))
	
	var recipe = ingredients_to_recipe(ingredients)
	print_debug(recipe)

func ingredients_to_recipe(ingredients : Array):
	for r in crafting_recipes:
		var recipe_requirements = []
		recipe_requirements.append_array(crafting_recipes[r])
		for i in ingredients:
			if array_contains_string(recipe_requirements,i):
				recipe_requirements.erase(i)
			print_debug("recipe requirements = " + str(recipe_requirements))
		if(recipe_requirements == []):
			return r

func array_contains_string(array, string):
	for s in array:
		print_debug(s + " == " + string + " ?")
		if s == string : return true
	return false


# Crafting Recipes

static var crafting_recipes = {
	"tool" : ["stick", "stone"]
}


# Button Connection
func _on_button_pressed():
	print_debug("pressed")
	craft()
