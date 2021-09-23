import 'package:flutter/material.dart';
import 'package:sky_wiki/constants.dart';
import 'package:sky_wiki/screens/detail/detail_screen.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.8),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                height: 129,
                width: 347,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 153),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: backgroundColor,
                    boxShadow: shadowList,
                  ),
                  child: Container(
                    child: child,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
