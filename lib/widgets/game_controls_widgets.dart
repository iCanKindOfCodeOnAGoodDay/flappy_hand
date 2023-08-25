import 'package:flappy_taco/models/sound_model.dart';
import 'package:flappy_taco/widgets/flashing_text_message_widget.dart';
import 'package:flappy_taco/widgets/flashing_text_widget.dart';
import 'package:flappy_taco/widgets/power_ups_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/game_status_provider.dart';
import 'cannon_switch_widget.dart';

SoundModel soundModel = SoundModel();

class GameControlsWidgets extends StatelessWidget {
  const GameControlsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// reload switch
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Hero(
              tag: 'fireBall',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: context.watch<GameStatusProvider>().cannons,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Multiplier: ${context.watch<GameStatusProvider>().amountOfTimeUserHitDoublePoints.toString()}x',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.w900,
                      fontSize: 8.0),
                ),
                Text(
                  'Hit: ${context.watch<GameStatusProvider>().basePointsForHittingBarrier.toString()}',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.w900,
                      fontSize: 8.0),
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CannonSwitch(
                    cannonIsLoaded:
                        context.watch<GameStatusProvider>().fullyLoaded,
                    remainingAmmo:
                        context.watch<GameStatusProvider>().roundsInMagazine,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Speed: ${context.watch<GameStatusProvider>().reverseGameSpeedToDisplayForUserAsTheyProgress.toString()}',
                  style: TextStyle(
                      color: context
                                  .watch<GameStatusProvider>()
                                  .shouldDisplayTimeIncrease ==
                              false
                          ? Colors.yellow
                          : kTransparent,
                      fontWeight: FontWeight.w900,
                      fontSize: 8.0),
                ),
                context.watch<GameStatusProvider>().shouldDisplayTimeIncrease ==
                        true
                    ? FlashingTextMessageWidget(text: '+100')
                    // ? Text(
                    //     '-50',
                    //     style: TextStyle(
                    //         color: Colors.greenAccent,
                    //         // fontFamily: ('HennyPenny'),
                    //         fontSize: 40.0,
                    //         fontWeight: FontWeight.w800),
                    //   )
                    : Container(),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.watch<GameStatusProvider>().nukeList.isNotEmpty == true
                ? GestureDetector(
                    onTap: () {
                      context
                          .read<GameStatusProvider>()
                          .timeBombExplosionOnScreen();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: context.watch<GameStatusProvider>().nukeList,
                    ),
                  )
                : Container(
                    height: 70.0,
                  ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: context
                                    .watch<GameStatusProvider>()
                                    .shouldDisplayDoublePointsEffects ==
                                false
                            ? AssetImage(
                                // 'images/componetFourArrowsSquareBloodDarkest.png',
                                'images/gameControlComponetsFourArrows1-18-23Standard.png',
                                // 'images/gameControlComponetsFourArrows1-18-23Combo.gif',
                              )
                            : AssetImage(
                                // 'images/componetFourArrowsSquareBloodDarkest.png',
                                'images/gameControlComponetsFourArrows1-18-23Combo.gif',
                              )),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: GestureDetector(
                          onTap: () {
                            context.read<GameStatusProvider>().handJump();
                          },
                        ),
                      ),
                      Container(
                        height: 100.0,
                        width: 100.0,
                        child: GestureDetector(
                          onTap: () {
                            context.read<GameStatusProvider>().handDive();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<GameStatusProvider>().fireHellFire();
                        context.read<GameStatusProvider>().handClimb();
                      },
                      child: Container(
                        height: 200.0,
                        width: 200.0,

                        // color: Colors.yellow,
                        decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(
                              // 'images/componetFullGreenButtonSquareBlackThumb.png',
                              // 'images/componetFullGreenButtonTriggerCombo.gif',
                              "images/componetFullGreenButtoniXGreen2.png")),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          context.read<GameStatusProvider>().handClimb();
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,

                          // color: Colors.yellow,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  //// this is the pause button
                                  'images/componetBottomButtonSquareBlack.png',
                                  // 'images/componetFullGreenButtonTriggerCombo.gif',
                                )),
                          ),
                          child: context.watch<GameStatusProvider>().crashed ==
                                  true
                              ? Container(
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(30),
                                  //   image: DecorationImage(
                                  //       fit: BoxFit.cover,
                                  //       image: AssetImage(
                                  //           'images/bloodyThumb.png')),
                                  // ),
                                  child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<GameStatusProvider>()
                                            .start();
                                        context
                                            .read<GameStatusProvider>()
                                            .handFall();
                                        context
                                            .read<GameStatusProvider>()
                                            .resetGame();
                                      },
                                      child: Icon(
                                        Icons.play_circle_outline_outlined,
                                        size: 50.0,
                                        color: kTransparent,
                                      )),
                                )
                              : context.watch<GameStatusProvider>().isPaused ==
                                      false
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'images/bloodyThumb.png')),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<GameStatusProvider>()
                                              .pauseGame();
                                        },
                                        child: Icon(
                                          Icons.pause_circle_outline,
                                          size: 50.0,
                                          color: kTransparent,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(30),
                                      //   image: DecorationImage(
                                      //       fit: BoxFit.cover,
                                      //       image: AssetImage(
                                      //           'images/bloodyThumb.png')),
                                      // ),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<GameStatusProvider>()
                                              .resumeGame();
                                        },
                                        child: Icon(
                                          Icons.play_circle_outline_outlined,
                                          size: 50.0,
                                          color: kTransparent,
                                        ),
                                      ),
                                    ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
