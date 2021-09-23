class Recipe {
  final String item_name;
  final String item_image;
  final String recipe_image;
  final List<dynamic> recipe_ingredients;

  Recipe(this.item_name, this.item_image, this.recipe_image,
      this.recipe_ingredients);

  Recipe.fromJson(Map<String, dynamic> json)
      : item_name = json['item_name'],
        item_image = json['item_image'],
        recipe_image = json['recipe_image'],
        recipe_ingredients = json['recipe_ingredients'];
}
