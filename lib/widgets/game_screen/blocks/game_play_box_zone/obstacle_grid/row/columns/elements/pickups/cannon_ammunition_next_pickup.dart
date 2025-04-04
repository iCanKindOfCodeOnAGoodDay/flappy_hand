import 'package:flappy_taco/providers/game_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmmoPickup extends StatelessWidget {
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
                    image: AssetImage('images/40mmBlackWhite.png'))),
          )
        : context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
                AmmoType.yellow
            ? Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/40mmOrange.png'))),
              )
            : context.watch<GamePlayVariableDataProvider>().currentAmmunition ==
                    AmmoType.purple
                ? Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/40mmGreen3.png'))),
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
                                image: AssetImage('images/40mmPink.png'))),
                      )
                    : Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/40mmBlue.png'))),
                      );
  }
}
