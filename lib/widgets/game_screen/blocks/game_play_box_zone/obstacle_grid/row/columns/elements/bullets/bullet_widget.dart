import 'package:flutter/material.dart';

class BulletWidget extends StatelessWidget {
  String path;

  BulletWidget({required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/$path'))),
    );
  }
}
