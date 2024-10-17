import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_status_provider.dart';

class BottomOfGameboyWidgets extends StatelessWidget {
  const BottomOfGameboyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              context.watch<GameStatusProvider>().roundsInMagazine >= 12
                  ? SizedBox(
                      height: 435.0,
                    )
                  : context.watch<GameStatusProvider>().roundsInMagazine == 0
                      ? SizedBox(
                          height: 445.0,
                        )
                      : SizedBox(
                          height: 440.0,
                        ),
              Center(
                child: Container(
                  height: 55.0,
                  // width: 400.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/60syellowReverse.png')),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 20.0, right: 20.0, bottom: 10),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                  'images/dotSquashAppsTransC4.gif')),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
