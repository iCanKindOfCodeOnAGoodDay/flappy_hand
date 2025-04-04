import 'package:flutter/material.dart';

class WinnableRocketsWidgets extends StatelessWidget {
  String path;

  WinnableRocketsWidgets({required this.path});

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
