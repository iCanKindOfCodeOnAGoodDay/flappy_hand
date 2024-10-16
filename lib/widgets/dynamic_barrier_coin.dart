import 'package:flappy_taco/providers/game_status_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DynamicCoin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context
                .watch<GameStatusProvider>()
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
        : context.watch<GameStatusProvider>().score <= 500
            ? Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/pendant.png'))),

                // image: AssetImage('images/pendantNew14Colors.gif'))),
              )
            : context.watch<GameStatusProvider>().score <= 1500
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/pendant2Coppe.png'))),
                  )
                : context.watch<GameStatusProvider>().score <= 2500
                    ? Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'images/pendant2Pink2.png',
                                  // 'images/pendant2Blue.png',
                                ))),
                      )
                    : context.watch<GameStatusProvider>().score <= 5000
                        ? Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'images/pendant2Green.png'))),
                          )
                        : context.watch<GameStatusProvider>().score <= 10000
                            ? Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'images/pendant2Orange.png'))),
                              )
                            : context.watch<GameStatusProvider>().score <= 15000
                                ? Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/pendant2Pink.png'))),
                                  )
                                : context.watch<GameStatusProvider>().score <=
                                        25000
                                    ? Container(
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'images/pendant2IceBlue.png'))),
                                      )
                                    : context
                                                .watch<GameStatusProvider>()
                                                .score <=
                                            35000
                                        ? Container(
                                            height: 40.0,
                                            width: 40.0,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'images/pendant2Purp.png'))),
                                          )
                                        : context
                                                    .watch<GameStatusProvider>()
                                                    .score <=
                                                45000
                                            ? Container(
                                                height: 40.0,
                                                width: 40.0,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            'images/pendant2Blue.png'))),
                                              )
                                            : context
                                                        .watch<
                                                            GameStatusProvider>()
                                                        .score <=
                                                    75000
                                                ? Container(
                                                    height: 40.0,
                                                    width: 40.0,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                'images/pendant2Purp2.png'))),
                                                  )
                                                : context
                                                            .watch<
                                                                GameStatusProvider>()
                                                            .score <=
                                                        100000
                                                    ? Container(
                                                        height: 40.0,
                                                        width: 40.0,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: AssetImage(
                                                                    'images/pendant2Red.png'))),
                                                      )
                                                    : context
                                                                .watch<
                                                                    GameStatusProvider>()
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
                                                                        'images/pendant2White.png'))),
                                                          )
                                                        : context
                                                                    .watch<
                                                                        GameStatusProvider>()
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
                                                                            'images/pendant2Plat.png'))),
                                                              )
                                                            : context
                                                                        .watch<
                                                                            GameStatusProvider>()
                                                                        .score <=
                                                                    1000000
                                                                ? Container(
                                                                    height:
                                                                        40.0,
                                                                    width: 40.0,
                                                                    decoration: BoxDecoration(
                                                                        image: DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image: AssetImage('images/pendant2Black.png'))),
                                                                  )
                                                                : context
                                                                            .watch<GameStatusProvider>()
                                                                            .score <=
                                                                        1500000
                                                                    ? Container(
                                                                        height:
                                                                            40.0,
                                                                        width:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/sparklingDiamondsPowerUp.gif'))),
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            40.0,
                                                                        width:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/pendantNew14Colors.gif'))),
                                                                      );
  }
}
