class Recipe {
  final String id;
  final String itemName;
  final String itemImage;
  final String recipeImage;
  final List<dynamic> recipeIngredients;

  Recipe(
    this.id,
    this.itemName,
    this.itemImage,
    this.recipeImage,
    this.recipeIngredients,
  );

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        itemName = json['item_name'],
        itemImage = json['item_image'],
        recipeImage = json['recipe_image'],
        recipeIngredients = json['recipe_ingredients'];
}
