import 'package:flutter/material.dart';

class WinnableKnifeWidget extends StatelessWidget {
  String path;

  WinnableKnifeWidget({required this.path});

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
