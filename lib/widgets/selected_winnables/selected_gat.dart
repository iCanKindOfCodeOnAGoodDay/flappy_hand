import 'package:flappy_taco/providers/premium_content_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedGat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 90.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                  'images/${context.watch<PremiumContentProvider>().playersGatChoiceString}'))),
    );
  }
}
