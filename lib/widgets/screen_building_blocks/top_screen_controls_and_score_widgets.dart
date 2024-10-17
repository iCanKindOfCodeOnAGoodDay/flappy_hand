import 'package:flappy_taco/providers/premium_content_provider.dart';
import 'package:flappy_taco/widgets/flashing_text_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../providers/game_status_provider.dart';
import '../coin_win_effect.dart';

class TopOfScreenControlsAndScoreWidgets extends StatelessWidget {
  const TopOfScreenControlsAndScoreWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black87),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      // width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('images/ledScreenBackground.jpg')),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: context
                                          .watch<GameStatusProvider>()
                                          .shouldDisplayDoublePointsEffects ==
                                      false
                                  ? Text(
                                      context
                                          .watch<GameStatusProvider>()
                                          .score
                                          .toString(),
                                      style: kScoreStyle)
                                  : FlashingTextMessageWidget(
                                      text: context
                                          .watch<GameStatusProvider>()
                                          .score
                                          .toString())),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                // 'images/sparklingDiamondsPowerUp.gif',
                                'images/blackDiamondABC.gif',
                              ))),
                    ),
                    Text(
                      '${(context.watch<PremiumContentProvider>().amountOfRubiesReadyToUse + context.watch<GameStatusProvider>().amountOFBonusGemsEarnedViaGamePlay).toString()}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ],
            ),
            context.watch<GameStatusProvider>().shouldShowCoinWinEffect == true
                ? Column(
                    children: [
                      // SizedBox(height: 300.0),
                      WinEffectForEachAmmoType(),
                    ],
                  )
                : Container(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  height: 60.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/pinkChestClosed.gif'))),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'images/componetLeftBlackButtonSquare.png')),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.settings,
                      size: 40.0,
                      color: Colors.white24,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          'images/componetRightBlackButtonSquare.png')),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        context.watch<GameStatusProvider>().crashed == false
                            ? BorderRadius.circular(80)
                            : BorderRadius.circular(0.0),
                  ),
                  child: context.watch<GameStatusProvider>().crashed == true
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                context.read<GameStatusProvider>().start();
                                context.read<GameStatusProvider>().handFall();
                                context.read<GameStatusProvider>().resetGame();
                              },
                              child: Icon(
                                Icons.play_circle_outline_outlined,
                                size: 50.0,
                                color: Colors.white24,
                              )),
                        )
                      : context.watch<GameStatusProvider>().isPaused == false
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<GameStatusProvider>()
                                      .pauseGame();
                                },
                                child: Icon(
                                  Icons.pause_circle_outline,
                                  size: 50.0,
                                  color: Colors.white24,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<GameStatusProvider>()
                                      .resumeGame();
                                },
                                child: Icon(
                                  Icons.play_circle_outline_outlined,
                                  size: 50.0,
                                  color: Colors.white24,
                                ),
                              ),
                            ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
