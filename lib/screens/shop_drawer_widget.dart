import 'package:flappy_taco/providers/premium_content_provider.dart';
import 'package:flappy_taco/widgets/flashing_text_message_widget.dart';
import 'package:flappy_taco/widgets/flashing_text_widget.dart';
import 'package:flappy_taco/widgets/openable_chest_widget.dart';
import 'package:flappy_taco/widgets/selected_winnables/selected_gat.dart';
import 'package:flappy_taco/widgets/winnables/winnable_beasts.dart';
import 'package:flappy_taco/widgets/winnables/winnable_consoles.dart';
import 'package:flappy_taco/widgets/winnables/winnable_shanks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flappy_taco/constants.dart';

import '../providers/game_status_provider.dart';

class ShopDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              'images/blackDiamondABC.gif'))),
                                ),
                                Text(
                                  '${(context.watch<PremiumContentProvider>().amountOfRubiesReadyToUse + context.watch<GameStatusProvider>().amountOFBonusGemsEarnedViaGamePlay).toString()}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    FlashingText(
                                      text: 'Add Rubies',
                                    ),
                                    // FlashingText(text: 'Do it do it do it'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    OpenableChest(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 50.0,
                          color: Colors.orange,
                        ),
                        GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            child: Icon(
                              Icons.settings,
                              size: 50.0,
                              color: Colors.orange,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 50.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<PremiumContentProvider>()
                                .openChestToGetRandomPrize();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    FlashingTextMessageWidget(
                                      text: 'Open chest?',
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // GestureDetector(
                        //     onTap: () {
                        //       context
                        //           .read<PremiumContentProvider>()
                        //           .addAllSkeletonGatsAsAvailableForTesting();
                        //     },
                        //     child: context
                        //                 .watch<PremiumContentProvider>()
                        //                 .addedAllSkeletonGuns ==
                        //             false
                        //         ? Container(
                        //             color: Colors.purple,
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Text(
                        //                 'press to add all guns!',
                        //                 style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontSize: 10.0,
                        //                     fontWeight: FontWeight.w800),
                        //               ),
                        //             ),
                        //           )
                        //         : Container(
                        //             color: Colors.black,
                        //             child: Padding(
                        //               padding: const EdgeInsets.all(8.0),
                        //               child: Text(
                        //                 'clear for testing!',
                        //                 style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontSize: 10.0,
                        //                     fontWeight: FontWeight.w800),
                        //               ),
                        //             ),
                        //           )),
                        Text(
                          'available:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w800),
                        ),
                        Column(
                          children: context
                              .watch<PremiumContentProvider>()
                              .itemsWonThatAreAvailableToEquip,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'bloods:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w800),
                        ),
                        Column(children: [kBlood, kBlood, kBlood]),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'lifes:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w800),
                        ),
                        Column(children: [kThingFalling, kThingFalling]),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'what can you win?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w800),
                        ),
                        context
                            .read<PremiumContentProvider>()
                            .displayAllWinnables(),
                        // Column(
                        //   children:
                        //       context.read<PremiumContentProvider>().winnables,
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
