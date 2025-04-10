import 'package:flappy_taco/providers/game_engine.dart';
import 'package:flappy_taco/services/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/settings_data.dart';

SoundModel soundModel = SoundModel();

class GameControlsWidgets extends StatelessWidget {
  const GameControlsWidgets({Key? key}) : super(key: key);

  get remainingAmmo => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// up and down buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              invertColors: true,
                              fit: BoxFit.fill,
                              image:
                                  AssetImage('images/double_jump_icon.png'))),
                      child: GestureDetector(
                        onTap: () {
                          context.read<GameEngine>().doubleJump();
                        },
                      ),
                    ),
                    // RotatedBox(
                    //   quarterTurns: 0,
                    //   child: Container(
                    //     height: 120.0,
                    //     width: 120.0,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(30),
                    //         image: DecorationImage(
                    //             colorFilter: ColorFilter.mode(
                    //                 Colors.red, BlendMode.color),
                    //             fit: BoxFit.fill,
                    //             image:
                    //                 AssetImage('images/double_jump_icon.png'))),
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         context.read<GameEngine>().shootJump();
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'images/${context.read<SettingsDataProvider>().grenadePath}'))),
                  child: GestureDetector(
                    onTap: () {
                      // context
                      //     .read<GamePlayVariableDataProvider>()
                      //     .handDive();
                      // context.read<GameEngine>().doubleJump('down');
                    },
                  ),
                ),
              ],
            ),

            ///  adding reload button back

            // fire gun button; pause and play buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('images/fireBallXPurple.gif'))),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  'images/${context.read<SettingsDataProvider>().pathSelectedPlayer}'))),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  'images/${context.read<SettingsDataProvider>().pathSelectedPlayer}'))),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  'images/${context.read<SettingsDataProvider>().pathSelectedPlayer}'))),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  'images/${context.read<SettingsDataProvider>().pathSelectedPlayer}'))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                GestureDetector(
                  onTap: () {
                    // context.read<GamePlayVariableDataProvider>().fireGun();
                    // context.read<GamePlayVariableDataProvider>().handClimb();
                    context.read<GameEngine>().jump();
                    context.read<GameEngine>().fireGun();
                    context.read<GameEngine>().addNewBulletForAnimation();
                  },
                  child: Container(
                    height: 150.0,
                    width: 150.0,

                    // color: Colors.yellow,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          invertColors: true,
                          fit: BoxFit.fill,
                          image: AssetImage(
                            // 'images/componetFullGreenButtonSquareBlackThumb.png',
                            // 'images/componetFullGreenButtonTriggerCombo.gif',
                            "images/UI_gunshot_boost.png",
                          )),
                      // "images/componetFullGreenButtoniXGreen2.png")),
                    ),
                  ),
                ),

                /*

            Pause and play buttons

             */
              ],
            ),
          ],
        ),

        ///TODO REIMPLEMENT
        /// bullets, extra lives, and 'red gems'
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       children: [
        //         Row(
        //           children: context
        //               .watch<GamePlayVariableDataProvider>()
        //               .bulletsBottom1,
        //
        //           /// flames
        //         ),
        //         Container(
        //           color: kTransparent,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //                 children: context
        //                     .watch<GamePlayVariableDataProvider>()
        //                     .redGems,
        //
        //                 /// red gems
        //               ),
        //               Row(
        //                 children: context
        //                     .watch<GamePlayVariableDataProvider>()
        //                     .extraLives,
        //
        //                 /// red gems
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               Center(
        //                 child: Container(
        //                   height: 50.0,
        //                   width: 50.0,
        //                   decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                           fit: BoxFit.fitWidth,
        //                           image: AssetImage(
        //                               "images/${context.read<SettingsDataProvider>().gunPath}"))),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //     Row(
        //       children:
        //           context.watch<GamePlayVariableDataProvider>().bulletsBottom2,
        //
        //       /// flames
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
