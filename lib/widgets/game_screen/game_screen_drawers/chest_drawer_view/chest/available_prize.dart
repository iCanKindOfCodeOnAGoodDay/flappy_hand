import 'package:flutter/material.dart';

class AvailablePrize extends StatelessWidget {
  String path;
  AvailablePrize({required this.path});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/scifi_arcade_black_screen_2.png'))),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage('images/$path'))),
        ),
      ),
    );
  }
}
