import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flappy_taco/widgets/game_screen/game_screen_drawers/chest_drawer_view/chest/prize_reveal_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../models/screen_effect.dart';
import '../../../../../../../providers/game_engine.dart';
import '../../../../../effects/combo_hits.dart';

/*

Device Screen Stack:

Row of buildings creating motion.
Columns of effects, including the player movement.

 */

class PlayBoxOfRetroDevice extends StatelessWidget {
  const PlayBoxOfRetroDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watchGameEngine = context.watch<GameEngine>();

    Stack pickupStack(GameEngine gd) {
      return Stack(
        children: gd.activePickups.value.map((pickup) {
          return Positioned(
            left: pickup.x,
            top: pickup.y,
            width: 30,
            height: 30,
            child: Image.asset(pickup.imagePath),
          );
        }).toList(),
      );
    }

    Stack towerOfZombiesBottom(double bottomY, double bottomH) {
      double heightToFill = bottomH + watchGameEngine.birdSize;
      int numZombies = heightToFill ~/ 40;
      double leftover = heightToFill % 40;

      List<Widget> zombies = [];
      if (leftover > 10) {
        zombies.add(
          Container(
            // color: Colors.black,
            height: leftover,
            width: 40,
            child: Image.asset('images/alien_head_ufo_giphy.gif',
                fit: BoxFit.contain),
          ),
        );
      }
      for (int i = 0; i < numZombies; i++) {
        zombies.add(Container(
          // color: Colors.red.withOpacity(0.3),
          height: 40,
          width: 40,
          child: Image.asset('images/alien_head_ufo_giphy.gif',
              fit: BoxFit.contain),
        ));
      }

      return Stack(
        children: [
          Positioned(
            top: 0, // align from top down
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: zombies,
            ),
          ),
        ],
      );
    }

    Stack towerOfZombiesTop(double topHeight) {
      double heightToFill = topHeight;
      int numZombies = heightToFill ~/ 40;
      double leftover = heightToFill % 40;

      List<Widget> zombies = List.generate(numZombies, (_) {
        return Container(
          height: 40,
          width: 40,
          // color: Colors.red.withOpacity(0.3), // see how small it actually is

          child: Image.asset('images/alien_head_ufo_giphy.gif',
              fit: BoxFit.contain),
        );
      });

      if (leftover > 20) {
        zombies.add(SizedBox(
          height: leftover,
          width: 40,
          child: Image.asset('images/alien_head_ufo_giphy.gif',
              fit: BoxFit.contain),
        ));
      }

      return Stack(
        children: [
          Positioned(
            top: 0, // align from top down
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: zombies,
            ),
          ),
        ],
      );
    }

    Stack obstacleStack(GameEngine gd) {
      return Stack(
        children: [
          ...List.generate(gd.obstacles.value.length, (index) {
            final x = gd.obstacles.value[index].x;
            final topHeight = gd.obstacles.value[index].height;
            final bottomY = topHeight + gd.gapHeight;
            final bottomHeight = gd.zombieScreenHeight - bottomY;

            return Stack(
              children: [
                Positioned(
                  left: x,
                  top: 0,
                  width: gd.obstacleWidth,
                  height: topHeight,
                  child: towerOfZombiesTop(topHeight),
                ),
                Positioned(
                  left: x,
                  top: bottomY,
                  width: gd.obstacleWidth,
                  height: gd.zombieScreenHeight,
                  child: towerOfZombiesBottom(bottomY, bottomHeight),
                ),
              ],
            );
          }),
        ],
      );
    }

    Stack bulletStack(GameEngine gd) {
      if (gd.bullets.value.isEmpty) {
        return const Stack(
          children: [SizedBox()],
        );
      }

      return Stack(
        children: [
          ...gd.bullets.value.map((bullet) {
            return Positioned(
              left: bullet.x,
              top: bullet.y, // or gd.birdY if you want to track bird only
              width: 30,
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('images/fireBallXPurple.gif'),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      );
    }

    Stack backgroundImageAnimation() {
      final gameEngine = context.watch<GameEngine>();

      if (gameEngine.backgroundImageX.length < 2) {
        return Stack(
          children: [
            CircularProgressIndicator(),
          ],
        ); // or any placeholder while waiting for init
      }

      return Stack(
        children: List.generate(2, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(
              children: [
                Positioned(
                  left: gameEngine.backgroundImageX[index],
                  top: 0,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            gameEngine.gameOver
                                ? 'images/gameOver.GIF'
                                : 'images/purpleStarsFreePicBlack.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      );
    }

    Stack playerStack() {
      return Stack(
        children: [
          Positioned(
            left: watchGameEngine.birdX,
            top: watchGameEngine.birdY,
            child: Stack(
              children: [
                context.watch<GameEngine>().gameOver == false
                    ? Container()
                    : Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/deadHand.gif'))),
                      ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          image: context.read<GameEngine>().displayGunShot
                              ? AssetImage(
                                  'images/${context.read<SettingsDataProvider>().gunPath}')
                              : AssetImage(
                                  'images/${context.read<SettingsDataProvider>().pathToSelectedWalkingHand}'))),
                  width: context.read<GameEngine>().displayGunShot
                      ? 70
                      : 70, // keep getting killed by this line - landing on bottom tower because it looks like im further forward
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      );
    }

/*
THIS IS THE BUILD WIDGET FOR THE PLAY BOX
 */
    // build play box
    return SizedBox(
      height: 500,
      width: 500,
      child: Stack(
        children: [
          Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/scifi_arcade_black_screen_2.png')),
            ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ValueListenableBuilder<int>(
            //       valueListenable: context.watch<GameEngine>().currentStep,
            //       builder: (context, step, _) {
            //         return StepProgressIndicator(
            //           totalSteps: 20,
            //           currentStep: step,
            //           size: 20,
            //           selectedColor: Colors.redAccent,
            //           unselectedColor: Colors.black,
            //           gradientColor: LinearGradient(
            //             begin: Alignment.topLeft,
            //             end: Alignment.bottomRight,
            //             colors: [Colors.grey, Colors.white],
            //           ),
            //         );
            //       },
            //     ),
            //   ],
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              /// this stack used to be child of DynamicBackgroundPlayBox

              children: [
                //space background
                Stack(
                  children: [
                    backgroundImageAnimation(),
                    context.read<GameEngine>().gameOver == true
                        ? Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    opacity: 0.8,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'images/blood2LightGreen.gif'))),
                          )
                        : Container()
                  ],
                ),

                ValueListenableBuilder<List<ScreenEffect>>(
                  valueListenable:
                      context.watch<GameEngine>().activeScreenEffects,
                  builder: (context, effects, child) {
                    if (effects.isEmpty) return SizedBox.shrink();

                    // Use the last (topmost) effect if multiple are active
                    final effect = effects.last;

                    return Positioned.fill(
                      child: Image.asset(
                        effect.imagePath,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "images/cyber_black_game_screen_frame_darker.png")),
                  ),
                ),

                ValueListenableBuilder(
                  valueListenable:
                      context.watch<GameEngine>().activeObstacleEffects,
                  builder: (context, effects, _) {
                    return Stack(
                      children: effects.map((effect) {
                        final obstacle = context
                            .watch<GameEngine>()
                            .obstacles
                            .value[effect.obstacleIndex];
                        return Positioned(
                          left: obstacle.x + effect.xOffset,
                          top: effect.y,
                          width: 30,
                          height: 30,
                          child: Image.asset(effect.imagePath),
                        );
                      }).toList(),
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: watchGameEngine.obstacles,
                  builder: (context, value, _) {
                    return obstacleStack(watchGameEngine);
                  },
                ),

                bulletStack(watchGameEngine),

                // Bird
                playerStack(),

                ValueListenableBuilder(
                  valueListenable: watchGameEngine.activePickups,
                  builder: (context, value, _) {
                    return pickupStack(watchGameEngine);
                  },
                ),

                // Game Over Text
                if (watchGameEngine.gameOver)
                  Center(
                    child: Text(
                      "Game Over\nTap to Restart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
              ],
            ),
          ),

          /// pop up - animated double kills graphics, etc.
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ComboHitsMessage(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
                child:
                    context.watch<SettingsDataProvider>().shouldHideTheLastPrize
                        ? Container()
                        : PrizeRevealAnimated()),
          ),
        ],
      ),
    );
  }
}
