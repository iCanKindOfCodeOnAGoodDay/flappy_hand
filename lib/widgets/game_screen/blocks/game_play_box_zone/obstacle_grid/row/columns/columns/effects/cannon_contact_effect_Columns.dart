import 'package:flappy_taco/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../../effects/coin_win_effect.dart';
import '../../elements/transparent_grid_block/transparent_grid_block.dart';

class BulletContactCheckerColumns extends StatelessWidget {
  int potentialContactPosition = -1;
  BulletContactCheckerColumns({required this.potentialContactPosition});
  @override
  Widget build(BuildContext context) {
    return potentialContactPosition <= 5
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // DevelopmentBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              potentialContactPosition == 6
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 5
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 4
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 3
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 2
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 1
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 0
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              // DevelopmentBlock(color: kBlankColor),
            ],
          )

/*

Buildings that appear upside down are here:


 */

        : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              kblankIcon,
              potentialContactPosition == 11
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 10
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 9
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 8
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 7
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 6
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 5
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 4
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              potentialContactPosition == 3
                  ? WinEffectForEachAmmoType()
                  : kblankIcon,
              TransparentGridBlock(color: kBlankColor),
            ],
          );
  }
}
