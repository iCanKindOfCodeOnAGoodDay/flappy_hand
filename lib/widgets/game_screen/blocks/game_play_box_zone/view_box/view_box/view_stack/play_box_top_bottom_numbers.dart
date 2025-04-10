import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../providers/game_engine.dart';

class PlayBoxTopBottomNumbers extends StatelessWidget {
  const PlayBoxTopBottomNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// top
        // Stack(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(top: 15, left: 20),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           Container(
        //             height: 15,
        //             width: 80,
        //             decoration: BoxDecoration(
        //                 image: DecorationImage(
        //                     image: AssetImage('images/kills_word.png'))),
        //           ),
        //           Text(
        //             "4",
        //             style: TextStyle(
        //                 fontSize: 15,
        //                 color: Colors.yellowAccent,
        //                 fontWeight: FontWeight.w800),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),

        /// bottom
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 460, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 15,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/level_word.png'))),
                  ),
                  Text(
                    "4",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 460),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 15,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/score_word.png'))),
                  ),
                  Text(
                    "48000",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 460, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 15,
                    width: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/clock_word.png'))),
                  ),
                  Text(
                    (30 - context.watch<GameEngine>().secondsSurvived)
                        .toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
