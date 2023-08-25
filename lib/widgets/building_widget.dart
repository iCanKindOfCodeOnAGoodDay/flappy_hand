import 'package:flappy_taco/constants.dart';
import 'package:flappy_taco/providers/game_status_provider.dart';
import 'package:flappy_taco/providers/premium_content_provider.dart';

import 'package:flappy_taco/widgets/development_block_widget.dart';
import 'package:flappy_taco/widgets/dynamic_barrier_coin.dart';

import 'package:flappy_taco/widgets/rotating_barrier_widget.dart';
import 'package:flappy_taco/widgets/rotating_icecream_bullet_widget.dart';

import 'package:flappy_taco/widgets/selected_winnables/selected_beast.dart';
import 'package:flappy_taco/widgets/selected_winnables/selected_grendade_widget.dart';
import 'package:flappy_taco/widgets/selected_winnables/selected_knife_widget.dart';
import 'package:flappy_taco/widgets/selected_winnables/selected_rocket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildingWidget extends StatelessWidget {
  int buildingHeight = 1;

  int powerUpPosition = 0;

  BuildingWidget({required this.buildingHeight, required this.powerUpPosition});

  @override
  Widget build(BuildContext context) {
    return buildingHeight == 21
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // DevelopmentBlock(color: kBlankColor),
              // DevelopmentBlock(color: kBlankColor),
              buildingHeight >= 10 ? kGoldCoin : kblankIcon,
              buildingHeight >= 9 ? kGoldCoin : kblankIcon,
              buildingHeight >= 8 ? kGoldCoin : kblankIcon,
              buildingHeight >= 7 ? kGoldCoin : kblankIcon,
              buildingHeight >= 6 ? kGoldCoin : kblankIcon,
              buildingHeight >= 5 ? kGoldCoin : kblankIcon,
              buildingHeight >= 4 ? kGoldCoin : kblankIcon,
              buildingHeight >= 3 ? kGoldCoin : kblankIcon,
              buildingHeight >= 2 ? kGoldCoin : kblankIcon,
              buildingHeight >= 1 ? kGoldCoin : kblankIcon,
              buildingHeight >= 0 ? kGoldCoin : kblankIcon,
              // kWeb,
            ],
          )
        : powerUpPosition > 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// the hand can fall down to 1, and climb up to 10
                  ///                   kblankIcon,
                  powerUpPosition == 10 ? kBlood : kblankIcon,
                  powerUpPosition == 9 ? kExtraLife : kblankIcon,
                  powerUpPosition == 8
                      ? SelectedGrenadeWidget(
                          onScreenPickupAndNotAGrenadeButton: true,
                        )
                      : kblankIcon,
                  powerUpPosition == 7 ? SelectedKnifeWidget() : kblankIcon,
                  powerUpPosition == 6 ? SelectedRocketWidget() : kblankIcon,
                  powerUpPosition == 5 ? SelectedBeastWidget() : kblankIcon,
                  powerUpPosition == 4 ? SelectedKnifeWidget() : kblankIcon,
                  powerUpPosition == 3
                      ? RotatingIcecreamBullet(
                          height: 40.0,
                          width: 40.0,
                          path:
                              '${context.watch<GameStatusProvider>().nextIceCreamBulletPath}')
                      : kblankIcon,
                  powerUpPosition == 2
                      ? RotatingIcecreamBullet(
                          height: 40.0,
                          width: 40.0,
                          path:
                              '${context.watch<GameStatusProvider>().nextIceCreamBulletPath}')
                      : kblankIcon,
                  powerUpPosition == 1 ? kNuke : kblankIcon,
                  // DevelopmentBlock(color: kBlankColor),
                ],
              )
            : buildingHeight <= 5
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // DevelopmentBlock(color: kBlankColor),
                      // DevelopmentBlock(color: kBlankColor),
                      DevelopmentBlock(color: kBlankColor),
                      DevelopmentBlock(color: kBlankColor),
                      DevelopmentBlock(color: kBlankColor),
                      DevelopmentBlock(color: kBlankColor),
                      DevelopmentBlock(color: kBlankColor),
                      buildingHeight >= 5
                          ? DynamicCoin()
                          // RotatingBarrierWidget(
                          //         path:
                          //             '${context.watch<PremiumContentProvider>().pathToSelectedBarrier}',
                          //       )
                          : kblankIcon,
                      buildingHeight >= 4
                          ? DynamicCoin()
                          // RotatingBarrierWidget(
                          //         path:
                          //             '${context.watch<PremiumContentProvider>().pathToSelectedBarrier}',
                          //       )
                          : kblankIcon,
                      buildingHeight >= 3
                          ? DynamicCoin()
                          // RotatingBarrierWidget(
                          //         path:
                          //             '${context.watch<PremiumContentProvider>().pathToSelectedBarrier}',
                          //       )
                          : kblankIcon,
                      buildingHeight >= 2
                          ? DynamicCoin()
                          // RotatingBarrierWidget(
                          //         path:
                          //             '${context.watch<PremiumContentProvider>().pathToSelectedBarrier}',
                          //       )
                          : kblankIcon,
                      buildingHeight >= 1
                          ? DynamicCoin()
                          // RotatingBarrierWidget(
                          //         path:
                          //             '${context.watch<PremiumContentProvider>().pathToSelectedBarrier}',
                          //       )
                          : kblankIcon,
                      buildingHeight >= 0
                          ? DynamicCoin()
                          // RotatingBarrierWidget(
                          //         path:
                          //             '${context.watch<PremiumContentProvider>().pathToSelectedBarrier}',
                          //       )
                          : kblankIcon,
                    ],
                  )

                /// upside down buildlings

                : buildingHeight == 20
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // DevelopmentBlock(color: kBlankColor),
                          // DevelopmentBlock(color: kBlankColor),
                          buildingHeight >= 10 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 9 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 8 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 7 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 6 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 5 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 4 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 3 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 2 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 1 ? kGoldCoin : kblankIcon,
                          buildingHeight >= 0 ? kGoldCoin : kblankIcon,
                          // kWeb,
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildingHeight <= 12
                              ? Transform.scale(
                                  scaleY: -1,
                                  // angle: 180.0,
                                  child: DynamicCoin())
                              : kblankIcon,
                          buildingHeight <= 11
                              ? Transform.scale(
                                  scaleY: -1,
                                  // angle: 180.0,
                                  child: DynamicCoin())
                              : kblankIcon,
                          // SelectedBarrierWidget(),
                          // SelectedBarrierWidget(),
                          buildingHeight <= 10
                              ? Transform.scale(
                                  scaleY: -1,
                                  // angle: 180.0,
                                  child: DynamicCoin())
                              : kblankIcon,
                          buildingHeight <= 9
                              ? Transform.scale(
                                  scaleY: -1,
                                  // angle: 180.0,
                                  child: DynamicCoin())
                              : kblankIcon,
                          buildingHeight <= 8
                              ? Transform.scale(
                                  scaleY: -1,
                                  // angle: 180.0,
                                  child: DynamicCoin())
                              : kblankIcon,
                          buildingHeight <= 7
                              ? Transform.scale(
                                  scaleY: -1,
                                  // angle: 180.0,
                                  child: DynamicCoin())
                              : kblankIcon,
                          buildingHeight <= 6
                              ? Transform.scale(
                                  scaleY: -1,
                                  // angle: 180.0,
                                  child: DynamicCoin())
                              : kblankIcon,
                          DevelopmentBlock(color: kBlankColor),
                          DevelopmentBlock(color: kBlankColor),
                          DevelopmentBlock(color: kBlankColor),
                          DevelopmentBlock(color: kBlankColor),
                        ],
                      );
  }
}
