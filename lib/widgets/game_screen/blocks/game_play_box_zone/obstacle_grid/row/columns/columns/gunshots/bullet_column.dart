import 'package:flappy_taco/constants.dart';
import 'package:flutter/material.dart';

import '../../elements/bullets/use_settings_returns_correct_gun_shot_for_grid.dart';
import '../../elements/transparent_grid_block/transparent_grid_block.dart';

class GunfireColumns extends StatelessWidget {
  int firePosition = -1;
  GunfireColumns({required this.firePosition});

  @override
  Widget build(BuildContext context) {
    return firePosition <= 5
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // DevelopmentBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              firePosition == 5 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 4 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 3 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 2 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 1 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 0 ? MatchesSettingsGunShot() : kblankIcon,
            ],
          )

        // upside down obstacle columns

        : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // kblankIcon,
              firePosition == 11 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 10 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 9 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 8 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 7 ? MatchesSettingsGunShot() : kblankIcon,
              firePosition == 6 ? MatchesSettingsGunShot() : kblankIcon,
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              TransparentGridBlock(color: kBlankColor),
              // DevelopmentBlock(color: kBlankColor),
            ],
          );
  }
}
