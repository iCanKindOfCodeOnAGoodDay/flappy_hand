import 'package:flappy_taco/providers/game_data.dart';
import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplodingRecoil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
            AmmoType.orange
        ? context.watch<SettingsDataProvider>().activatedExplodingRecoil ==
                false
            ? Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/coinWin.gif'))),
              )
            : Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/x2Explosion.gif'))),
              )
        : context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
                AmmoType.yellow
            ? context.watch<SettingsDataProvider>().activatedExplodingRecoil ==
                    false
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/2yellowCoinWin.gif'))),
                  )
                : Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/x2ExplosionYellow.gif'))),
                  )
            : context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
                    AmmoType.purple
                ? context
                            .watch<SettingsDataProvider>()
                            .activatedExplodingRecoil ==
                        false
                    ? Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('images/x2ExplosionGreen.gif'))),
                      )
                    : Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'images/x2ExplosionBluePurple.gif'))),
                      )
                //// else unused_delete type is flashing
                : context
                            .watch<GamePlayVariableDataProvider>()
                            .currentAmmunition ==
                        AmmoType.blue
                    ? context
                                .watch<SettingsDataProvider>()
                                .activatedExplodingRecoil ==
                            false
                        ? Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'images/3greenCoinWin2.gif'))),
                          )
                        : Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'images/x2ExplosionGreenPurple.gif'))),
                          )
                    : context
                                .watch<GamePlayVariableDataProvider>()
                                .currentAmmunition ==
                            AmmoType.flashing
                        ? context
                                    .watch<SettingsDataProvider>()
                                    .activatedExplodingRecoil ==
                                false
                            ? Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'images/5redCoinWinEffect.gif'))),
                              )
                            : Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'images/x2ExplosionRed.gif'))),
                              )
                        : context
                                    .watch<GamePlayVariableDataProvider>()
                                    .currentAmmunition ==
                                AmmoType.black
                            ? context
                                        .watch<SettingsDataProvider>()
                                        .activatedExplodingRecoil ==
                                    false
                                ? Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/6blackCoinWin.gif'))),
                                  )
                                : Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/x2ExplosionBlack.gif'))),
                                  )
                            : context
                                        .watch<SettingsDataProvider>()
                                        .activatedExplodingRecoil ==
                                    false
                                ? Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/7whiteCoinWin.gif'))),
                                  )
                                : Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/x2ExplosionWhite.gif'))),
                                  );
  }
}
