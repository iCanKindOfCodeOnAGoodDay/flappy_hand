import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../providers/game_data.dart';

class FortyMMBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'images/${context.watch<GamePlayVariableDataProvider>().pathToFortyMMBullet}'))),
        ),
      ],
    );
  }
}
