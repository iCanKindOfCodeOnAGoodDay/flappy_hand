import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Hero(
      tag: "score_bar",
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.0),
        child: Container(
          // width: screenWidth * .8,
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('images/cyber_black_game_screen_black_mono.png'),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.black,
                  // image: DecorationImage(
                  //     fit: BoxFit.fill,
                  //     image: AssetImage('images/space_zombie_stars.png')),
                  // borderRadius: BorderRadius.circular(20),
                  ),
              // height: 70,
              // width: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // zomb skills, sppeed, level, upgrads widget
                    // Container(
                    //   decoration: BoxDecoration(
                    //       border: Border.all(width: 2, color: Colors.white),
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.black87),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Container(
                    //           color: Colors.black,
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'Zomb Kills',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 10),
                    //               ),
                    //               Text(
                    //                 ' 298',
                    //                 style: TextStyle(
                    //                     color: Colors.yellowAccent,
                    //                     fontSize: 10,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           color: Colors.black,
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'Speed',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 10),
                    //               ),
                    //               Text(
                    //                 ' 3',
                    //                 style: TextStyle(
                    //                     color: Colors.yellowAccent,
                    //                     fontSize: 10,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           color: Colors.black,
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'Level',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 10),
                    //               ),
                    //               Text(
                    //                 ' 1',
                    //                 style: TextStyle(
                    //                     color: Colors.yellowAccent,
                    //                     fontSize: 10,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Container(
                    //           color: Colors.black,
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'Upgrades',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontWeight: FontWeight.w700,
                    //                     fontSize: 10),
                    //               ),
                    //               Text(
                    //                 ' 3x',
                    //                 style: TextStyle(
                    //                     color: Colors.yellowAccent,
                    //                     fontSize: 10,
                    //                     fontWeight: FontWeight.w700),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.yellowAccent, width: 2),
                                borderRadius: BorderRadius.circular(2)),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Icon(Icons.leaderboard_outlined,
                                  color: Colors.yellowAccent, size: 20.0),
                            )),
                        SizedBox(width: 10),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.yellowAccent, width: 2),
                                borderRadius: BorderRadius.circular(2)),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Icon(Icons.person_2_outlined,
                                  color: Colors.yellowAccent, size: 20.0),
                            )),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          context
                              .read<SettingsDataProvider>()
                              .openChestToGetRandomPrize();
                          context
                              .read<SettingsDataProvider>()
                              .handleOpenChestAnimation(); // questions?
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('images/UI_black_chest.png'),
                                  fit: BoxFit.fill)),
                        )
                        // OpenableChest(), // replacing with just a chest for now
                        ),
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('images/UI_armory_black.png')),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage('images/UI_settings_black.png')),
                        ),
                      ),
                    ),

                    /// 30 - seconds survived
                    // Container(
                    //   decoration: BoxDecoration(
                    //       border: Border.all(width: 2, color: Colors.white),
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.black87),
                    //   child: Padding(
                    //       padding: const EdgeInsets.all(3),
                    //       child: context
                    //                   .watch<GamePlayVariableDataProvider>()
                    //                   .shouldDisplayDoublePointsEffects ==
                    //               false
                    //           ? Column(
                    //               crossAxisAlignment: CrossAxisAlignment.center,
                    //               children: [
                    //                 Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   children: [
                    //                     // Text(
                    //                     //   'survival'.toUpperCase(),
                    //                     //   style: TextStyle(
                    //                     //     fontSize: 8,
                    //                     //     color: Colors.white,
                    //                     //   ),
                    //                     // ),
                    //                     // Text(
                    //                     //   'CLOCK',
                    //                     //   style: TextStyle(
                    //                     //     fontSize: 8,
                    //                     //     color: Colors.white,
                    //                     //   ),
                    //                     // ),
                    //                   ],
                    //                 ),
                    //                 Text(
                    //                     (30 -
                    //                             context
                    //                                 .watch<GameEngine>()
                    //                                 .secondsSurvived)
                    //                         .toString(),
                    //                     style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontWeight: FontWeight.w900,
                    //                         fontSize: 30)),
                    //               ],
                    //             )
                    //           : FlashingTextMessageWidget(
                    //               text: (30 -
                    //                       context
                    //                           .watch<GameEngine>()
                    //                           .secondsSurvived)
                    //                   .toString())),
                    // ),

                    // score
                    // Container(
                    //   decoration: BoxDecoration(
                    //       border: Border.all(width: 2, color: Colors.white),
                    //       borderRadius: BorderRadius.circular(10),
                    //       color: Colors.black87),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       crossAxisAlignment: CrossAxisAlignment.end,
                    //       children: [
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.end,
                    //           children: [
                    //             Text(
                    //               'Score',
                    //               style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 10),
                    //             ),
                    //             Text(
                    //               '23000',
                    //               style: TextStyle(
                    //                   color: Colors.yellowAccent,
                    //                   fontSize: 10,
                    //                   fontWeight: FontWeight.w700),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
