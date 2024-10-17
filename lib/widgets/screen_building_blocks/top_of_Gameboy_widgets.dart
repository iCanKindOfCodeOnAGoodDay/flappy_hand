import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_status_provider.dart';

class TopOfGameboyWidgets extends StatelessWidget {
  const TopOfGameboyWidgets({Key? key}) : super(key: key);

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

                  /// account for full magazine
                  ? SizedBox(
                      height: 26.0,
                    )
                  : context.watch<GameStatusProvider>().roundsInMagazine == 0

                      /// account for no rows
                      ? SizedBox(
                          height: 39.0,
                        )

                      /// account for one row
                      : SizedBox(
                          height: 32.0,
                        ),
              Container(
                height: 110.0,
                // width: 400.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('images/60syellowLongTopEditRaised.png')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
