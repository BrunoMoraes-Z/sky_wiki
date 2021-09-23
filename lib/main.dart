import 'package:flutter/material.dart';
import 'package:sky_wiki/screens/home/homo_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sky Wiki',
      home: HomeScreen(),
    );
  }
}
