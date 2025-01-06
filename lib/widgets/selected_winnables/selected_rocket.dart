import 'package:flutter/material.dart';

class SelectedCrystalBallWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                "images/crystalBallXXXXX.gif",
                // 'images/${context.watch<PremiumContentProvider>().pathToSelectedRocket}',
              ))),
    );
  }
}
