import 'package:flappy_taco/providers/game_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*

March 2025,

Zombies are organized
in 'elements' aka columns of obstacles.
Note: Player collision with obstacles loses a life.

 */

class ZombieObstacle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context
                .watch<GamePlayVariableDataProvider>()
                .shouldDisplayDoublePointsEffects ==
            true
        ? Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/pendantNew14Colors.gif'))),
          )
        : context.watch<GamePlayVariableDataProvider>().score <= 500
            ? Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        // image: AssetImage('images/kimBoom.gif'))),

                        image: AssetImage('images/zombie_1.GIF'))),
              )
            : context.watch<GamePlayVariableDataProvider>().score <= 1500
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/zombie_2.GIF'))),
                  )
                : context.watch<GamePlayVariableDataProvider>().score <= 2500
                    ? Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'images/zombie_3.GIF',
                                ))),
                      )
                    : context.watch<GamePlayVariableDataProvider>().score <=
                            5000
                        ? Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/zombie_4.GIF'))),
                          )
                        : context.watch<GamePlayVariableDataProvider>().score <=
                                10000
                            ? Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage('images/zombie_5.GIF'))),
                              )
                            : context
                                        .watch<GamePlayVariableDataProvider>()
                                        .score <=
                                    15000
                                ? Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/zombie_6.GIF'))),
                                  )
                                : context
                                            .watch<
                                                GamePlayVariableDataProvider>()
                                            .score <=
                                        35000
                                    ? Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  'images/zombie_8.gif', // - GOTCHYA - this is the 'original' zombie and has extension w/ lowercase letters
                                                ))),
                                      )
                                    : context
                                                .watch<
                                                    GamePlayVariableDataProvider>()
                                                .score <=
                                            45000
                                        ? Container(
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'images/zombie_9.GIF'))),
                                          )
                                        : context
                                                    .watch<
                                                        GamePlayVariableDataProvider>()
                                                    .score <=
                                                75000
                                            ? Container(
                                                height: 40.0,
                                                width: 40.0,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/zombie_10.GIF'))),
                                              )
                                            : context
                                                        .watch<
                                                            GamePlayVariableDataProvider>()
                                                        .score <=
                                                    100000
                                                ? Container(
                                                    height: 40.0,
                                                    width: 40.0,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                'images/zombie_11.GIF'))),
                                                  )
                                                : context
                                                            .watch<
                                                                GamePlayVariableDataProvider>()
                                                            .score <=
                                                        250000
                                                    ? Container(
                                                        height: 40.0,
                                                        width: 40.0,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: AssetImage(
                                                                    'images/zombie_12.GIF'))),
                                                      )
                                                    : context
                                                                .watch<
                                                                    GamePlayVariableDataProvider>()
                                                                .score <=
                                                            500000
                                                        ? Container(
                                                            height: 40.0,
                                                            width: 40.0,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: AssetImage(
                                                                        'images/zombie_13.GIF'))),
                                                          )
                                                        : Container(
                                                            height: 40.0,
                                                            width: 40.0,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: AssetImage(
                                                                        'images/zombie_14.GIF'))),
                                                          );
  }
}
