import 'package:flappy_taco/providers/game_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../constants.dart';

class DeadEffectColumn extends StatelessWidget {
  int position = 6;

  DeadEffectColumn({required this.position});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        position == 11
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 10
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 9
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 8
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 7
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 6
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 5
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 4
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 3
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 2
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
        position == 1
            ? context.watch<GamePlayVariableDataProvider>().crashed == true
                ? kDeadHand
                : kblankIcon
            : Icon(
                Icons.circle,
                color: position == 11 ? kBlankSquare : kBlankColor,
                size: 40.0,
              ),
      ],
    );
  }
}
