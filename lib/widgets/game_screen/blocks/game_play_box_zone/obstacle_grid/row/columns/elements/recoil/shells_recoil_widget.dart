import 'package:flappy_taco/providers/game_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShellsRecoil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
            AmmoType.orange
        ? Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/bulletsCC1.gif'))),
          )
        : context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
                AmmoType.yellow
            ? Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/bulletsCCYellow2.gif'))),
              )
            : context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
                    AmmoType.purple
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/bulletsCCPurplex.gif'))),
                  )
                : context
                            .watch<GamePlayVariableDataProvider>()
                            .currentAmmunition ==
                        AmmoType.blue
                    ? Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('images/bulletsCCBlue2.gif'))),
                      )
                    : context
                                .watch<GamePlayVariableDataProvider>()
                                .currentAmmunition ==
                            AmmoType.flashing
                        ? Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('images/bulletsCCRed.gif'))),
                          )
                        : context
                                    .watch<GamePlayVariableDataProvider>()
                                    .currentAmmunition ==
                                AmmoType.black
                            ? Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'images/bulletsCCBlack.gif'))),
                              )
                            : Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'images/bulletsCCWhitexxx.gif'))),
                              );
  }
}
