import 'package:flappy_taco/constants.dart';
import 'package:flappy_taco/providers/game_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../elements/bullets/spinning_bullet.dart';
import '../../elements/obstacle/zombie_obstacle.dart';
import '../../elements/selections/pickups/selected_beast.dart';
import '../../elements/selections/pickups/selected_grendade_widget.dart';
import '../../elements/selections/pickups/selected_knife_widget.dart';
import '../../elements/selections/pickups/selected_rocket.dart';
import '../../elements/transparent_grid_block/transparent_grid_block.dart';

/*
    Building Height Key

        --
    21        gold coin
    PU 0      power-up building
    PU 1      blank icon
    <=5       bottom building - any value less than zero creates an empty space
    20        gold coin
    6-11      top building - any value greater than 11, but not 20 and 21 is used to create empty space
                           - note, ignored if power up position is zero above

     */

class Buildings extends StatelessWidget {
  late final int buildingHeight;
  final int powerUpPosition;
  final double positionX; // Now correctly used for animation

  Buildings({
    required this.buildingHeight,
    required this.powerUpPosition,
    required this.positionX,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(positionX, 0), // Smoothly shifts leftward
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _buildColumnChildren(context),
      ),
    );
  }

  List<Widget> _buildColumnChildren(BuildContext context) {
    /*

    Based on variable building height.
    We build different types of 'obstacle's


    When you add new building, must give it a height to assign type of building
    To make it a power up building, give it a power up position.


     */

    // check if height is 21 this should be a column with a gold coin
    if (buildingHeight == 21) {
      return List.generate(11, (index) => kGoldCoin);
    } else if (powerUpPosition > 0) {
      // check if height is 21 this should be a column with a power up
      return [
        if (powerUpPosition == 10) kBlood else kblankIcon,
        if (powerUpPosition == 9)
          Image.asset('images/astronaut2.GIF', width: 40, height: 40)
        else
          kblankIcon,
        if (powerUpPosition == 8)
          SelectedGrenadeWidget(onScreenPickupAndNotAGrenadeButton: true)
        else
          kblankIcon,
        if (powerUpPosition == 7) SelectedKnifeWidget() else kblankIcon,
        if (powerUpPosition == 6) SelectedCrystalBallWidget() else kblankIcon,
        if (powerUpPosition == 5) SelectedMonsterWidget() else kblankIcon,
        if (powerUpPosition == 4) SelectedKnifeWidget() else kblankIcon,
        if (powerUpPosition >= 3)
          Ammo(
            height: 40,
            width: 40,
            path: context
                .watch<GamePlayVariableDataProvider>()
                .nextBulletFilePath,
          )
        else
          kblankIcon,
        if (powerUpPosition == 1) kNuke else kblankIcon,
      ];
      // check if height is 5 or less this should be a list of zombie obstacles
    } else if (buildingHeight <= 5) {
      return List.generate(
        6,
        (index) => index >= (6 - buildingHeight)
            ? ZombieObstacle()
            : TransparentGridBlock(color: kBlankColor),
      );
      // check if building height == 20 this should be a list of gold coins
    } else if (buildingHeight == 20) {
      return List.generate(11, (index) => kGoldCoin);
      // what building height do you pass in here?
    } else {
      // else check if building height is 6 or more and build a list of zombie obstacles
      // max building height is max tower size which i believe is 11
      return List.generate(
        6,
        (index) => index >= (6 - buildingHeight)
            ? Transform.scale(scaleY: -1, child: ZombieObstacle())
            : TransparentGridBlock(color: kBlankColor),
      );
    }
  }
}
