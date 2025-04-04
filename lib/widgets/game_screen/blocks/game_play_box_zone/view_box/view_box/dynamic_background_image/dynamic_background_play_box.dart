import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../providers/game_data.dart';
import '../../../../../../../providers/settings_data.dart';

/*

Game Play Output
Image Backgrounds:

Slideshow.


 */

class DynamicBackgroundPlayBox extends StatelessWidget {
  Widget child;

  DynamicBackgroundPlayBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      /*

          This is the game play.
          Since the app is setup like a retro device,
          There is a 'screen' on the device.
          This is that screen.


           */

      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/scifi_arcade_black_screen_2.png')),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),

        /// this is supposed to be the positioned widget
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/space_background.jpg')),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.fill,

                /*

                    The retro device screen displays various images,
                    based on updates in the game.


                     */
                image: context
                            .read<GamePlayVariableDataProvider>()
                            .displayLifeLossWhenStabbed ==
                        true
                    ? AssetImage(
                        "images/jenniferLaurenceNo.GIF",
                      )
                    : context
                                .watch<GamePlayVariableDataProvider>()
                                .shouldDisplayTimeIncrease ==
                            true
                        ? AssetImage(
                            'images/ooooSharpBlackSpaceBright.gif',
                          )
                        : context
                                    .watch<GamePlayVariableDataProvider>()
                                    .shouldDisplayKnifeDefense ==
                                true
                            ? AssetImage(
                                'images/IMG_6724_icon.PNG',
                              )

                            /// disable 'blood's pick up effect on screen for now
                            // : context
                            //             .read<GamePlayVariableDataProvider>()
                            //             .shouldDisplayBandaidPickup ==
                            //         true
                            //     ? AssetImage('images/djangoLiondardoOne.gif')
                            : context
                                        .watch<GamePlayVariableDataProvider>()
                                        .crashed ==
                                    false
                                ? AssetImage(
                                    'images/${context.watch<SettingsDataProvider>().pathToSelectedBackgroundImage}')

                                /*

                                    This is our animated background image - with the various game over slides in slide show format

                                     */
                                // : AssetImage('images/gameOver.GIF'),

                                /*

                During game over this will be the background image showed in the slide show.

                 */
                                : AssetImage(
                                    'images/cyber_black_game_screen_frame.PNG'),
                // : AssetImage(
                //     'images/scifi_arcade_black_screen.png'),

                // : AssetImage('images/black.png'),
              ),
            ),
            child: Container(
              decoration: context
                          .watch<GamePlayVariableDataProvider>()
                          .shouldDisplayExplosion2 ==
                      true
                  ? BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'images/deathStar150.gif',
                          )))
                  : context
                              .watch<GamePlayVariableDataProvider>()
                              .shouldDisplayExplosion1 ==
                          true
                      ? BoxDecoration(
                          image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/explosionFlames.gif'),
                        ))
                      : context
                                  .read<GamePlayVariableDataProvider>()
                                  .displayLifeLossWhenStabbed ==
                              true
                          ? BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'images/${context.watch<SettingsDataProvider>().pathToSelectedKnife}')))
                          : context
                                      .read<GamePlayVariableDataProvider>()
                                      .shouldDisplayQuickLifePickup ==
                                  true
                              ? BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'images/${context.watch<GamePlayVariableDataProvider>().lifePickupScreenEffectPath}',
                                      )))
                              : context
                                          .read<GamePlayVariableDataProvider>()
                                          .shouldDisplayBandaidPickup ==
                                      true
                                  ? BoxDecoration()
                                  : context
                                              .read<
                                                  GamePlayVariableDataProvider>()
                                              .shouldDisplayBloodSplatQuick ==
                                          true
                                      ? BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'images/blood2.gif',
                                              )))
                                      : context.read<GamePlayVariableDataProvider>().shouldDisplayQuickHorror ==
                                              true
                                          ? BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image:
                                                      AssetImage('images/blood2.gif')))
                                          : BoxDecoration(),
              child: Container(
                decoration: context
                            .read<GamePlayVariableDataProvider>()
                            .shouldDisplayBandaidPickup ==
                        true
                    ? BoxDecoration()
                    : context
                                .read<GamePlayVariableDataProvider>()
                                .displayLifeLossWhenStabbed ==
                            true
                        ? BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    'images/${context.watch<SettingsDataProvider>().pathToSelectedKnife}')))
                        : BoxDecoration(),

                /*

                Game Play Rows

                 */
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
