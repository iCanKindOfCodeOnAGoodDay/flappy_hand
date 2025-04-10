import 'package:flappy_taco/providers/game_data.dart';
import 'package:flappy_taco/services/audio_service.dart';
import 'package:flappy_taco/widgets/alien_screen_cover_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../settings_option_widget.dart';

SoundModel soundModel = SoundModel();

class SettingsEndDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        AlienAnimationScreen(),
        Container(
          // color: Colors.white,
          child: ListView(
            children: [
              Container(
                // color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'swipe to exit',
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Column(
                    children: [
                      SettingOption(
                        arg: context
                            .watch<GamePlayVariableDataProvider>()
                            .hearSoundEffects,
                        label: 'Sound Effects',
                        onTap: () {
                          // soundModel.turnOnSoundEffects();
                          // soundModel.playReloadSound();
                          context
                              .read<GamePlayVariableDataProvider>()
                              .turnOnSoundEffects();
                        },
                      ),
                      // SettingOption(
                      //     arg: context
                      //         .read<SettingsDataProvider>()
                      //         .activatedShankShooter,
                      //     label: 'Knife Bullets',
                      //     onTap: () {
                      //       context
                      //           .read<SettingsDataProvider>()
                      //           .toggleShankShooter();
                      //     }),
                      // SettingOption(
                      //     arg: context
                      //         .watch<SettingsDataProvider>()
                      //         .activatedExplodingAmmo,
                      //     label: 'Exploding Ammo',
                      //     onTap: () {
                      //       context
                      //           .read<SettingsDataProvider>()
                      //           .toggleExplodingHitMarkers();
                      //     }),
                      // SettingOption(
                      //   arg: context
                      //       .watch<SettingsDataProvider>()
                      //       .activatedShellCasingsInsteadOfSparks,
                      //   label: "Shell Casings",
                      //   onTap: () {
                      //     context
                      //         .read<SettingsDataProvider>()
                      //         .toggleShellCasingsInsteadOfSparks();
                      //   },
                      // ),
                      // SettingOption(
                      //   arg: context
                      //       .watch<SettingsDataProvider>()
                      //       .activatedExplodingRecoil,
                      //   label: 'Exploding Recoil',
                      //   onTap: () {
                      //     context
                      //         .read<SettingsDataProvider>()
                      //         .toggleExplodingRecoil();
                      //   },
                      // ),
                      // SettingOption(
                      //   arg: context
                      //       .watch<SettingsDataProvider>()
                      //       .activatedSkeletonHand,
                      //   label: 'Skeleton Hand',
                      //   onTap: () {
                      //     context.read<SettingsDataProvider>().toggleSkeletonHand();
                      //   },
                      // ),
                      // SettingOption(
                      //   arg:
                      //       context.watch<SettingsDataProvider>().activated20MMAmmo,
                      //   label: '20MM Ammo',
                      //   onTap: () {
                      //     context.read<SettingsDataProvider>().toggle20MMAmmo();
                      //   },
                      // ),
                      // SettingOption(
                      //   arg:
                      //       context.watch<SettingsDataProvider>().activated40MMAmmo,
                      //   label: '40MM Ammo',
                      //   onTap: () {
                      //     context.read<SettingsDataProvider>().toggle40MMAmmo();
                      //   },
                      // ),
                      // SettingOption(
                      //   arg: context
                      //       .watch<SettingsDataProvider>()
                      //       .activatedFireBallAmmo,
                      //   label: 'Fireball Ammo',
                      //   onTap: () {
                      //     context.read<SettingsDataProvider>().toggleFireBallAmmo();
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
