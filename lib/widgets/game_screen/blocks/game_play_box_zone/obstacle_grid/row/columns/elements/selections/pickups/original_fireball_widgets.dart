import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../providers/game_data.dart';

class OriginalFireBallWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
            AmmoType.orange
        ? Container(
            height: 30.0,
            width: 30.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/fireball6.png'))),
          )
        : context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
                AmmoType.yellow
            ? Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/fireball6Yellow.png'))),
              )
            : context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
                    AmmoType.purple
                ? Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/1flyingPink.png'))),
                  )
                //// else unused_delete type is flashing
                : context
                            .watch<GamePlayVariableDataProvider>()
                            .currentAmmunition ==
                        AmmoType.blue
                    ? Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/fireball6Blue.png'))),
                      )
                    : context
                                .watch<GamePlayVariableDataProvider>()
                                .currentAmmunition ==
                            AmmoType.flashing
                        ? Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('images/fireBallXX.gif'))),
                          )
                        : context
                                    .watch<GamePlayVariableDataProvider>()
                                    .currentAmmunition ==
                                AmmoType.black
                            ? Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'images/flyingBlack.png'))),
                              )
                            : Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'images/flyingWhite.png'))),
                              );
  }
}
