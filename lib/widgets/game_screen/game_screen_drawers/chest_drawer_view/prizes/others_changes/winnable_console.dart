import 'package:flutter/material.dart';

class WinnableConsoleWidgets extends StatelessWidget {
  String path;

  WinnableConsoleWidgets({required this.path});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/$path'))),
      ),
    );
  }
}
