import 'package:flappy_taco/providers/game_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComboHitsMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<GamePlayVariableDataProvider>().comboHits == 2
        ? Column(
            children: [
              Container(
                height: 42.0,
                width: 340.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/hitKiller.png'))),
              ),
            ],
          )
        : context.watch<GamePlayVariableDataProvider>().comboHits == 3
            ? Container(
                height: 229.0,
                width: 319.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/hitSplat.png'))),
              )
            : context.watch<GamePlayVariableDataProvider>().comboHits == 3
                ? Container(
                    height: 60.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/4xUltraHit.gif'))),
                  )
                : Container();
  }
}
