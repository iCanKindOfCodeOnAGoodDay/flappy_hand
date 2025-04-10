import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../enums/screen_effect_type.dart';
import '../../../../../models/screen_effect.dart';
import '../../../../../providers/game_engine.dart';
import '../zone/game_controls_zone.dart';
import 'game_result_pop_up.dart';

class DeathPopUpWidget extends StatelessWidget {
  const DeathPopUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: context.watch<GameEngine>().gameOverNotifier,
          builder: (context, gameOver, child) {
            if (gameOver)
              return ValueListenableBuilder<List<ScreenEffect>>(
                valueListenable:
                    context.watch<GameEngine>().activeScreenEffects,
                builder: (context, effects, child) {
                  final gameOverEffects = effects
                      .where((e) => e.type == ScreenEffectType.gameOver)
                      .toList();

                  if (gameOverEffects.isEmpty) return GameResultsPopup();

                  final effect = gameOverEffects.first;

                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 4),
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(effect.imagePath))),
                        ),
                      ],
                    ),
                  );
                },
              );
            return GameControlsWidgets();
          },
        ),
      ],
    );
  }
}
