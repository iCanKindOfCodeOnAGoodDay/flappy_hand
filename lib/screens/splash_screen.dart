import 'dart:async';

import 'package:flappy_taco/constants.dart';
import 'package:flappy_taco/models/sound_model.dart';
import 'package:flappy_taco/providers/game_status_provider.dart';
import 'package:flappy_taco/screens/game_play_screen.dart';
import 'package:flappy_taco/widgets/rotating_barrier_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SoundModel soundModel = SoundModel();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    soundModel.playOtherSounds('cannonUpgrade.mp3', true);
    soundModel.playWarningAlarm(true);

    // context.read<GameStatusProvider>().setBackgroundMusicToTrue();
    // soundModel.playSpookyMusic(
    //     context.read<GameStatusProvider>().hearBackgroundMusic);
    // soundModel.playLoopSizzleSound(
    //     context.read<GameStatusProvider>().hearBackgroundMusic);
    // // soundModel.playCreapyWingsSound(
    // //     context.read<GameStatusProvider>().hearBackgroundMusic);
    // soundModel.playLoopElectricChair(
    //     context.read<GameStatusProvider>().hearBackgroundMusic);
    // // soundModel.playScreechSound(
    // //     context.read<GameStatusProvider>().hearBackgroundMusic);
    // soundModel.playLoopFireworksSounds(
    //     context.read<GameStatusProvider>().hearBackgroundMusic);

    /// TODO check if user is logged in
    /// if they are, play background music and
    /// send them to the game play screen
    /// TODO for now, send user straight to game play screen after a delay to display splash screen
    Timer flappyHandSoundsTimer = Timer(Duration(seconds: 5), () {
      soundModel.warningAlarm(true);
    });
    Timer transitionTimer = Timer(Duration(seconds: 3), () {
      context.read<GameStatusProvider>().fireExplosion1();
      soundModel.playOtherSounds5x('customExplosion.mp3', true);

      // soundModel.playSpookyMusic(true);
      // soundModel.playOtherSounds5x('assets/explosionAndDebris.mp3', true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) {
            // play sounds
            return GamePlayScreen();
          },
        ),
      );
    });

    void replaceBlankIconsWithZombieCards() {
      for (var i = 0; i < 13; i++) {
        /// replace 13 blank icons by removing the blank icon at the end
        /// every 200th of a seconds
        int delay = i * 200;
        Timer(Duration(milliseconds: delay), () {
          listOfIconsToBeReplacedByZombieCards
              .removeAt(listOfIconsToBeReplacedByZombieCards.length - 1);
          listOfIconsToBeReplacedByZombieCards.insert(
              0,
              (Expanded(
                child: RotatingBarrierWidget(
                  // path: 'pendantNew14Colors.gif',
                  // path: 'blackDiamondABC.gif',
                  path: "standardGrenade1-18-23GreenRed.png",
                  // path: 'cube-white-t.png',
                ),
              )));
          setState(() {});

          /// udate the interface 13 times
        });
      }
    }

    replaceBlankIconsWithZombieCards();

    /// carrry out the instructions defined above
    //
  }

  List<Widget> listOfIconsToBeReplacedByZombieCards = [
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
    kblankIcon,
  ];

  String imageFileName = "consumeJesus-unscreen.gif";

  String fireBallPathTop = 'consumeJesus-unscreen.gif';

  String fireBallPathBottom = 'mmjakFuzzyInvertPink.gif';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          // image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: AssetImage(
          //       // 'images/dotSquashGameConsoleGrey.png',
          //
          //       'images/psychadelic.gif',
          //     )),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.0,
              ),
              // Container(
              //   height: 500.0,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     image: DecorationImage(
              //         fit: BoxFit.fill,
              //         image: AssetImage('images/ledScreenBackground.jpg')),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       decoration: BoxDecoration(
              //           // borderRadius: BorderRadius.circular(20.0),
              //           image: DecorationImage(
              //         fit: BoxFit.fill,
              //         image: AssetImage('images/gameOver.GIF'),
              //       )),
              //     ),
              //   ),
              // ),
              // //

              Expanded(
                child: Hero(
                  tag: 'fireBall',
                  child: Container(
                    // width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage('images/introv2-82523.gif'))),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                // height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: listOfIconsToBeReplacedByZombieCards,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //
              Expanded(
                child: Hero(
                  tag: 'fireBall',
                  child: Container(
                    // width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              'images/taylorSwiftCelebration.gif',
                              // 'images/IMG_6896_alien2.png',
                            ))),
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
