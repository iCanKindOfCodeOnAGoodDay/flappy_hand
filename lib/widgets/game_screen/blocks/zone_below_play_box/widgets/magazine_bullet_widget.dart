import 'package:flutter/material.dart';

class MagazineBullet extends StatelessWidget {
  String bullet_path;

  MagazineBullet({required this.bullet_path});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      width: 33,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              image: AssetImage('images/$bullet_path'))),
    );
  }
}
