import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KnifeBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(-180),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'images/${context.watch<SettingsDataProvider>().pathToSelectedKnife}'))),
      ),
    );
  }
}
