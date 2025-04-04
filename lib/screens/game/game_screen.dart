import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_engine.dart';
import '../../widgets/game_screen/blocks/game_play_box_zone/view_box/view_box/view_stack/play_box.dart';
import '../../widgets/game_screen/blocks/score_bar/score_bar.dart';
import '../../widgets/game_screen/blocks/zone_below_play_box/zone/game_controls_zone.dart';
import '../../widgets/game_screen/effects/two_x_wineffect_widgets.dart';
import '../../widgets/game_screen/game_screen_drawers/chest_drawer_view/drawer_view/chest_drawer_widget.dart';
import '../../widgets/game_screen/game_screen_drawers/settings_view/end_drawer_view/settings_end_drawer.dart';

/*

March 2025,

If we are going to show gifs during game at the bottom of the 'game',
we can add that here perhaps, or within one of the view_box's children

1

              First container widget is the background image of the game view_box,
              which is a retro game console.


2


              This widget is for an effect,
              which changes the retro device color rapidly
              to create an 'explosion' effect.



 3

              At the 'front layer' of our stack,
              we have the 3 building blocks
              of the game view_box.




 */
class GamePlayScreen extends StatefulWidget {
  @override
  State<GamePlayScreen> createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  @override
  void initState() {
    super.initState();
    // Delay to ensure we are not updating until after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final gameEngine = Provider.of<GameEngine>(context, listen: false);
      gameEngine.setupBackgroundAnimationImageList();
      gameEngine.gameLoopNew();
    });
    context.read<GameEngine>().setupBackgroundAnimationImageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShopDrawerWidget(),
      endDrawer: SettingsEndDrawerWidget(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                // 'images/space_zombie_background.PNG',
                'images/cyber_black_game_screen_black_mono.png',
              )),
        ),
        child: Container(
          // color: Colors.white10,
          child: Stack(
            children: [
              // Container(
              //   /*
              //
              //   This first container widget is the background image of the game screen,
              //   which is a retro game console.
              //
              //    */
              //
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage(
              //           context
              //                       .watch<GamePlayVariableDataProvider>()
              //                       .purpleGameBoy ==
              //                   true
              //               ? 'images/futuristicGameConsoleNoLogo2BLANKLOGO copy 3.png'
              //               : context
              //                           .watch<GamePlayVariableDataProvider>()
              //                           .silverGameBoy ==
              //                       true
              //                   ? 'images/dotSquashGameConsoleGrey.png'
              //                   : context
              //                               .watch<GamePlayVariableDataProvider>()
              //                               .redGameBoyInsteadOfYellow ==
              //                           false
              //                       ? 'images/dotSquashGameConsoleWhiteInvert.png'
              //                       : 'images/dotSquashGameConsoleSilver.png',
              //         )),
              //   ),
              // ),
              // Opacity(
              //   /*
              //
              //   This widget is for an effect,
              //   which changes the retro device color rapidly
              //   to create an 'explosion' effect.
              //
              //    */
              //   opacity: context
              //               .watch<GamePlayVariableDataProvider>()
              //               .shouldDisplayDoublePointsEffects ==
              //           false
              //       ? 1.0
              //       : context
              //           .watch<GamePlayVariableDataProvider>()
              //           .opacityOfBlackGameBoy,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //           fit: BoxFit.cover,
              //           image: AssetImage(
              //             'images/${context.watch<PremiumContentProvider>().pathToSelectedGameConsole}',
              //           )),
              //     ),
              //   ),
              // ),
              TwoXWinEffectWidgets(),
              Column(
                /*

                At the 'front layer' of our stack,
                we have the 3 building blocks
                of the game screen.

                 */

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // CustomAppBar(),
                  //
                  SizedBox(
                    height:
                        12, // could move this up a bit at least on my iPhone 12 max
                  ),
                  GestureDetector(
                      onTap: () {
                        context.read<GameEngine>().jump();
                      },
                      child: PlayBoxOfRetroDevice()),
                  WidgetBar(),

                  // retro device 'screen'
                  Stack(
                    children: [
                      context.watch<GameEngine>().gameOver == true
                          ? Padding(
                              padding: const EdgeInsets.only(top: 0.0, left: 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   width: 10,
                                  //   color: Colors.white12,
                                  // ),
                                  // borderRadius: BorderRadius.circular(10),
                                  // color: Colors.black,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'images/scifi_arcade_black_screen.png')),
                                ),
                                // height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 60.0),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'USER SPREE'.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 60.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Time Survived: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text(
                                                        '${(30 + context.watch<GameEngine>().secondsSurvived) - 30}',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Knives: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text('8',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Monsters hit: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text('8',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Time Survived: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text(
                                                        '${(30 + context.watch<GameEngine>().secondsSurvived) - 30}',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Knives: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text('8',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Monsters hit: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text('8',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Lives used: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text('8',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Grendades: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text('8',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Grendades: ',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                    Text('8',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .yellowAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<GameEngine>()
                                                    .jump();
                                                // start 3, 2, 1, Timer - use those for string values to get the player ready!
                                                // Future.delayed(Duration(seconds: 3), () { /// lets just start gravity equal to zero at frst?
                                                //   context.read<GameEngine>().jump();
                                                // });
                                                // then restart game
                                              },
                                              child: Container(
                                                height: 100,
                                                width: 180,
                                                decoration: BoxDecoration(
                                                    image: (DecorationImage(
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                          Colors.pinkAccent
                                                              .shade400,
                                                          BlendMode
                                                              .modulate, // overlays red onto the image
                                                        ),
                                                        fit: BoxFit.contain,
                                                        image: AssetImage(
                                                            'images/UI_button_start.PNG')))),
                                              )
                                              // Icon(
                                              //   Icons.cancel_outlined,
                                              //   color: Colors.white,
                                              //   size: 80,
                                              // ),
                                              ),
                                          Row(
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Icon(
                                                        Icons
                                                            .leaderboard_outlined,
                                                        color: Colors.white,
                                                        size: 30.0),
                                                  )),
                                              SizedBox(width: 10),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            1.0),
                                                    child: Icon(
                                                        Icons.person_2_outlined,
                                                        color: Colors.white,
                                                        size: 30.0),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 50),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : GameControlsWidgets(),
                    ],
                  ), //  everything below 'screen' on retro device
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
