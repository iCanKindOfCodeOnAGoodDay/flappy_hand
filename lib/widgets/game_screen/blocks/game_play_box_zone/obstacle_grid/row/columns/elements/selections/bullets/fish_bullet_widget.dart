import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../constant_lists.dart';
import '../../../../../../../../../../providers/game_data.dart';

class FishBulletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(90),
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'images/${moreFish[context.watch<GamePlayVariableDataProvider>().indexToFireDifferentFishBullets]}'))),
      ),
    );
  }
}
