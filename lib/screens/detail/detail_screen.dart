import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_wiki/models/recipe.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.recipe,
    required this.imageServer,
  }) : super(key: key);

  final String imageServer;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    // var recipeUrl = '$imageServer${recipe.recipeImage}.png';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Image.network(
            '${imageServer}recipe-${recipe.id}.png',
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  color: const Color(0xffe09601),
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (ctx, obj, trace) {
              return FittedBox(
                child: Column(
                  children: const [
                    Icon(Icons.error, size: 60, color: Colors.redAccent),
                    SizedBox(height: 20),
                    Text(
                      'Ouve um erro ao tentar carregar esta Receita.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Imagem não encontrada.',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // Image.asset(
          //   'assets/recipes/recipe-${recipe.id}.png',
          //   errorBuilder: (ctx, obj, trace) {
          //     return FittedBox(
          //       child: Column(
          //         children: const [
          //           Icon(Icons.error, size: 60, color: Colors.redAccent),
          //           SizedBox(height: 20),
          //           Text(
          //             'Ouve um erro ao tentar carregar esta Receita.',
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //           SizedBox(height: 20),
          //           Text(
          //             'Imagem não encontrada.',
          //             style: TextStyle(
          //               fontStyle: FontStyle.italic,
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'Materiais Nescessários',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 5),
          Column(
            children: List.generate(
              recipe.recipeIngredients.length,
              (index) {
                var ingr = recipe.recipeIngredients[index] as String;
                var amount = ingr.split(' x ')[0];
                var itemName = ingr.split(' x ')[1];
                return Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text.rich(
                    TextSpan(
                      text: amount,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                      children: [
                        const TextSpan(
                          text: ' x ',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: itemName,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
