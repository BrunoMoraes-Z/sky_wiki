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
    var recipeUrl = '$imageServer${recipe.recipe_image}.png';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Container(
            // constraints: const BoxConstraints(
            //   maxWidth: 800,
            //   maxHeight: 300,
            // ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.network(
              recipeUrl,
              headers: const {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET,HEAD,POST,OPTIONS',
              },
              fit: BoxFit.fill,
              // loadingBuilder: (ctx, obj, loadingProgress) {
              //   if (loadingProgress == null) return Container();
              //   return Row(
              //     children: [
              //       CircularProgressIndicator(
              //         color: const Color(0xffE09601),
              //         value: loadingProgress.expectedTotalBytes != null
              //             ? loadingProgress.cumulativeBytesLoaded /
              //                 loadingProgress.expectedTotalBytes!.toInt()
              //             : null,
              //       ),
              //       const SizedBox(width: 32),
              //       const Text(
              //         'Carregando...',
              //         style: TextStyle(fontWeight: FontWeight.w600),
              //       ),
              //     ],
              //   );
              // },
              errorBuilder: (ctx, obj, trace) {
                return FittedBox(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.error,
                        size: 60,
                        color: Colors.redAccent,
                      ),
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
          ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'Materiais Nescessários',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          Column(
            children: List.generate(
              recipe.recipe_ingredients.length,
              (index) {
                var ingr = recipe.recipe_ingredients[index] as String;
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
