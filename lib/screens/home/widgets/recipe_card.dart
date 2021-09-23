import 'package:flutter/material.dart';
import 'package:sky_wiki/constants.dart';
import 'package:sky_wiki/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.imageServer,
    required this.recipe,
    required this.onTap,
  }) : super(key: key);

  final String imageServer;
  final Recipe recipe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // var itemUrl = '$imageServer${recipe.itemImage}.png';

    Widget card = FittedBox(
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: recipe.recipeImage.isNotEmpty ? onTap : null,
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff8B8B8B),
              boxShadow: shadowList,
            ),
            child: Row(
              children: [
                Image.asset('assets/recipes/item-${recipe.id}.png'),
                const SizedBox(width: 10),
                Text(
                  recipe.itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return recipe.recipeImage.isNotEmpty
        ? card
        : Tooltip(
            message: 'Este item não possui Receita.',
            preferBelow: false,
            textStyle: const TextStyle(
              color: Colors.black,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: shadowList,
            ),
            child: card,
          );
  }
}
