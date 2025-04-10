import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flappy_taco/widgets/game_screen/blocks/game_play_box_zone/view_box/view_box/view_stack/play_box_top_bottom_numbers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../enums/screen_effect_type.dart';
import '../../../../../../../models/screen_effect.dart';
import '../../../../../../../providers/game_engine.dart';
import '../../../../../effects/combo_hits.dart';
import '../../../../../game_screen_drawers/chest_drawer_view/chest/prize_reveal_animated.dart';

/*

Device Screen Stack:

Stack of positioned widgets mostly create the stack.
Powered by Game Engine.
Rendering of game events based on user input.
Player view area of the game -- Like a gameBoy Screen.

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
            width: 50,
            height: 50,
            child: Image.asset(pickup.imagePath),
          );
        }).toList(),
      );
    }

    String zombiePath = 'images/Cute_Alien_Knife.png';

    Stack towerOfZombiesBottom(double bottomY, double bottomH) {
      double heightToFill = bottomH + watchGameEngine.birdSize;
      int numZombies = heightToFill ~/ 50;
      double leftover = heightToFill % 50;

      List<Widget> zombies = [];
      if (leftover > 10) {
        zombies.add(
          Container(
            // color: Colors.black,
            height: leftover,
            width: 50,
            child: Image.asset(zombiePath, fit: BoxFit.contain),
          ),
        );
      }
      for (int i = 0; i < numZombies; i++) {
        zombies.add(Container(
          // color: Colors.red.withOpacity(0.3),
          height: 50,
          width: 50,
          child: Image.asset(zombiePath, fit: BoxFit.contain),
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
      int numZombies = heightToFill ~/ 50;
      double leftover = heightToFill % 50;

      List<Widget> zombies = List.generate(numZombies, (_) {
        return Container(
          height: 50,
          width: 50,
          // color: Colors.red.withOpacity(0.3), // see how small it actually is

          child: Image.asset(zombiePath, fit: BoxFit.contain),
        );
      });

      if (leftover > 20) {
        zombies.add(SizedBox(
          height: leftover,
          width: 50,
          child: Image.asset(zombiePath, fit: BoxFit.contain),
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
          return Stack(
            children: [
              Positioned(
                left: gameEngine.backgroundImageX[index],
                top: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          gameEngine.gameOver
                              ? 'images/gameOver.GIF'
                              : 'images/cave_adobe.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                                image: AssetImage(
                                    'images/black_blood_player_death_effect.gif'))),
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
                                  'images/${context.read<SettingsDataProvider>().pathSelectedPlayer}'))),
                  width: context.read<GameEngine>().displayGunShot
                      ? 70
                      : 70, // keep getting killed by this linRe - landing on bottom tower because it looks like im further forward
                  height: 70,
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
                  // invertColors: true,
                  fit: BoxFit.fill,
                  image: AssetImage('images/scifi_arcade_black_screen_2.png')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                /// effect
                /// not planning on using the background image animatino -- for now - and will prob update it to be a smaller effect
                // Stack(
                //   children: [
                //     backgroundImageAnimation(),
                //     context.read<GameEngine>().gameOver == true
                //         ? Container(
                //             decoration: BoxDecoration(
                //                 image: DecorationImage(
                //                     opacity: 0.9,
                //                     fit: BoxFit.fill,
                //                     image:
                //                         AssetImage('images/blood2Black2.gif'))),
                //           )
                //         : Container()
                //   ],
                // ),

                /// new red background image
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // invertColors: true,
                          // colorFilter: ColorFilter.mode(
                          //   Colors.grey.shade900,
                          //   BlendMode.modulate,
                          // ),
                          fit: BoxFit.fill,
                          image:
                              AssetImage('images/red_black_alien_planet.png'))),
                ),

                /// PickupEffects
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
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),

                ValueListenableBuilder<List<ScreenEffect>>(
                  valueListenable:
                      context.watch<GameEngine>().activeScreenEffects,
                  builder: (context, effects, child) {
                    final nonGameOverEffects = effects
                        .where((e) => e.type != ScreenEffectType.gameOver)
                        .toList();

                    if (nonGameOverEffects.isEmpty) return SizedBox.shrink();

                    return Stack(
                      children: [
                        for (final effect in nonGameOverEffects)
                          Positioned.fill(
                            child: Image.asset(
                              effect.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    );
                  },
                ),

                /// frame
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        // invertColors: true,
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "images/cyber_black_game_screen_frame_darker.png")),
                  ),
                ),
                // ValueListenableBuilder<bool>(
                //   valueListenable: context.watch<GameEngine>().gameOverNotifier,
                //   builder: (context, isGameOver, child) {
                //     if (isGameOver)
                //       return Positioned.fill(
                //         child: Container(),
                //       );
                //     if (!isGameOver) return Positioned.fill(child: Container());
                //   },
                // ),
                // ValueListenableBuilder<bool>(
                //   valueListenable: context.watch<GameEngine>().gameOverNotifier,
                //   builder: (context, isGameOver, child) {
                //     return Stack(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //               image: DecorationImage(
                //                   image: AssetImage(
                //                       'images/red_black_alien_planet.png'))),
                //         ),
                //       ],
                //     );
                //   },
                // ),

                /// obstacleBloodEffects
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

                /// top and bottom towers of zombies
                ValueListenableBuilder(
                  valueListenable: watchGameEngine.obstacles,
                  builder: (context, value, _) {
                    return obstacleStack(watchGameEngine);
                  },
                ),

                /// bullets
                bulletStack(watchGameEngine),

                /// Bird
                playerStack(),

                ValueListenableBuilder(
                  valueListenable: watchGameEngine.activePickups,
                  builder: (context, value, _) {
                    return pickupStack(watchGameEngine);
                  },
                ),

                /// GameOver
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

              /// TODO - connect this. maybe use it more often! Change the images probably though.
              /// or delete the dirty bastard
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
          PlayBoxTopBottomNumbers(),

          /// when tap chest, prize animates over the play box
        ],
      ),
    );
  }
}
