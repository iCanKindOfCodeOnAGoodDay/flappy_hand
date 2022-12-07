import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_status_provider.dart';

class SecondPowerUps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Row(
        //   children: context.watch<GameStatusProvider>().extraLives,
        //
        //   /// red gems
        // ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: context.watch<GameStatusProvider>().flames,

              /// flames
            ),
            Row(
              children: context.watch<GameStatusProvider>().flamesSecond,

              /// flames
            ),
          ],
        ),
      ],
    );
  }
}
