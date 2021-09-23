class Recipe {
  final String id;
  final String itemName;
  final List<dynamic> recipeIngredients;

  Recipe(
    this.id,
    this.itemName,
    this.recipeIngredients,
  );

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        itemName = json['item_name'],
        recipeIngredients = json['recipe_ingredients'];
}
