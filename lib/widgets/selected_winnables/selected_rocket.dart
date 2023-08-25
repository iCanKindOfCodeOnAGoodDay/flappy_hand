import 'package:flappy_taco/providers/premium_content_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedRocketWidget extends StatelessWidget {
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
