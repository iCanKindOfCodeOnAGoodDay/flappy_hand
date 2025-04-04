import 'package:flappy_taco/providers/game_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../constants.dart';
import '../../elements/player/skeleton_finger_gun_widget.dart';
import '../../elements/player/thing_dead_widget_dynamic.dart';
import '../../elements/player/thing_walking_widget_dynamic.dart';
import '../../elements/selections/gun/selected_gun.dart';

class PlayerColumn extends StatelessWidget {
  int position = 6;

  PlayerColumn({required this.position});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 100,
          child: Column(
            children: [
              position == 11
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 10
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 9
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 8
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 7
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 6
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 5
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 4
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 3
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 2
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
              position == 1
                  ? context.watch<GamePlayVariableDataProvider>().isClimbing ==
                          true
                      ? SelectedGun()
                      : context
                                  .watch<GamePlayVariableDataProvider>()
                                  .triedFiringWhenOutOfAmmo ==
                              true
                          ? SkeletonFingerGunWidget()
                          : context
                                      .watch<GamePlayVariableDataProvider>()
                                      .showADeadHand ==
                                  false
                              ? ThingWalkingDynamicWidget()
                              : ThingDeadDynamicWidget()
                  : Icon(
                      Icons.circle,
                      color: position == 11 ? kBlankSquare : kBlankColor,
                      size: 40.0,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
