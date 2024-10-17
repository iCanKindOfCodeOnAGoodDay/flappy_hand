import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_status_provider.dart';

class TopScreenWidgets extends StatelessWidget {
  const TopScreenWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<GameStatusProvider>().crashed == true
        ? Container(
            height: 400.0,
            child: Container(
              height: 700.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/blood2v.gif'))),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 440.0,
                width: 30.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/transparentStaticLayer.gif'
                            // 'images/blackRedYellowExplosion.gif',
                            ))),
              ),
            ],
          );
  }
}
