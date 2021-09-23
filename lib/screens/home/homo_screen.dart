import 'package:flutter/material.dart';
import 'package:sky_wiki/screens/home/widgets/home_background.dart';
import 'package:sky_wiki/screens/home/widgets/recipe_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBackground(
        child: RecipeLoader(),
      ),
    );
  }
}
