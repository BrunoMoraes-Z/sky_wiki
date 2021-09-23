import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:sky_wiki/constants.dart';
import 'package:sky_wiki/models/recipe.dart';
import 'package:sky_wiki/screens/detail/detail_screen.dart';
import 'package:sky_wiki/screens/home/widgets/recipe_card.dart';

class RecipeLoader extends StatefulWidget {
  RecipeLoader({Key? key}) : super(key: key);

  @override
  _RecipeLoaderState createState() => _RecipeLoaderState();
}

class _RecipeLoaderState extends State<RecipeLoader> {
  List<Recipe> recipes = [];
  String imageServer = '';

  Future<dynamic> readRecipes() async {
    recipes.clear();
    var response = await http.get(recipesUrl);
    var jsonContent = jsonDecode(response.body);
    imageServer = jsonContent['image_server'];
    var jsonRecipes = jsonContent['recipes'] as List<dynamic>;
    for (var element in jsonRecipes) {
      recipes.add(Recipe.fromJson(element));
    }
    return jsonContent;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readRecipes(),
      builder: (ctx, snapshot) {
        return SingleChildScrollView(
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            children: List.generate(
              recipes.length,
              (index) {
                return RecipeCard(
                  imageServer: imageServer,
                  recipe: recipes[index],
                  onTap: () async {
                    await NDialog(
                      title: Center(
                        child: Text(
                          recipes[index].item_name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      content: DetailScreen(
                        imageServer: imageServer,
                        recipe: recipes[index],
                      ),
                    ).show(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
