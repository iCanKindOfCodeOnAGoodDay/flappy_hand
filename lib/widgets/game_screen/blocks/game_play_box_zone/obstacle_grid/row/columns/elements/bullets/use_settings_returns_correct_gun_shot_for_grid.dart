import 'package:flappy_taco/providers/game_data.dart';
import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../selections/bullets/20mm_bullet_widget.dart';
import '../selections/bullets/40MM_bullet_widget.dart';
import '../selections/bullets/color_changing_bullet_widget.dart';
import '../selections/bullets/fish_bullet_widget.dart';
import '../selections/bullets/knife_bullet.dart';
import '../selections/bullets/trump_bullet_widget.dart';
import '../selections/pickups/original_fireball_widgets.dart';
import 'spinning_bullet_duplicate.dart';

class MatchesSettingsGunShot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<SettingsDataProvider>().activatedShankShooter == false
        ? context.watch<SettingsDataProvider>().activatedTrumpAmmo == true
            ? TrumpBulletWidget()
            : context.watch<SettingsDataProvider>().activatedFishAmmo == true
                ? FishBulletWidget()
                : context.watch<SettingsDataProvider>().activated20MMAmmo ==
                        true
                    ? TwentyMMBullet()
                    : context.watch<SettingsDataProvider>().activated40MMAmmo ==
                            true
                        ? FortyMMBullet()
                        : context
                                    .watch<SettingsDataProvider>()
                                    .activatedColorChangingBullets ==
                                true
                            ? ColorChangingBullet()
                            : context
                                        .watch<SettingsDataProvider>()
                                        .activatedFireBallAmmo ==
                                    true
                                ? OriginalFireBallWidgets()
                                : RotatingBullet2(
                                    path:
                                        '${context.watch<GamePlayVariableDataProvider>().bulletPath}',
                                    height: 40.0,
                                    width: 40.0,
                                  )
        : KnifeBullet();
  }
}
