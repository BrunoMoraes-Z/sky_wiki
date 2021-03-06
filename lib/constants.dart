import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xffECECEC);
final Uri recipesUrl = Uri.parse(
  'https://raw.githubusercontent.com/BrunoMoraes-Z/sky_wiki/assets/recipes.json',
);
// final File recipesFile = File.fromUri(Uri.file('../assets/data/recipes.json'));
final BoxShadow shadow = BoxShadow(
  blurRadius: 40,
  color: Colors.black.withOpacity(15),
  offset: const Offset(0, 16),
);

const List<BoxShadow> shadowList = [
//  box-shadow: 0px 3px 12px -3px rgb(0 0 0 / 50%);
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.5),
    spreadRadius: -9,
    blurRadius: 20,
    offset: Offset(10, 10),
  ),
  // BoxShadow(
  //   color: Colors.grey.withOpacity(0.5),
  //   spreadRadius: 5,
  //   blurRadius: 7,
  //   offset: const Offset(0, 3), // changes position of shadow
  // ),
];
