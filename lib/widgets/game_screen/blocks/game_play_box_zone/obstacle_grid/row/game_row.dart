import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../providers/game_engine.dart';

class GameRow extends StatelessWidget {
  const GameRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   /*
    //
    //           These are the elements moving
    //           from right to left on screen during game play.
    //           How?
    //           Children changing.
    //           Children: list called buildings located in data provider.
    //           Think about each row index as an obstacle tower or an 'empty' space.
    //           These are the elements moving
    //           from right to left on screen during game play.
    //
    //
    //            */
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: context.watch<GamePlayVariableDataProvider>().buildings,

    var gd = context.watch<GameEngine>();
    return Stack(
      children: [
        // Obstacles
        ...List.generate(gd.obstacles.value.length, (index) {
          final x = gd.obstacles.value[index].x;
          final topHeight = gd.obstacles.value[index].height;
          final bottomY = topHeight + gd.gapHeight;
          final bottomHeight = gd.zombieScreenHeight - bottomY;
          print("top Obstacle Height: $topHeight");
          print("bottomY, bottom pipe beings at: $bottomY");
          print("bottom Obstacle ends at: $bottomHeight");

          return Stack(
            children: [
              Positioned(
                left: x,
                top: 0,
                width: gd.obstacleWidth,
                height: topHeight,
                child: Container(color: Colors.green),
              ),
              Positioned(
                left: x,
                top: bottomY,
                width: gd.obstacleWidth,
                height: bottomHeight,
                child: Container(color: Colors.green),
              ),
            ],
          );
        }),

        // Bird
        Positioned(
          left: 100,
          top: gd.birdY,
          child: Container(
            width: gd.birdSize,
            height: gd.birdSize,
            color: Colors.red,
          ),
        ),

        // Game Over Text
        if (gd.gameOver)
          Center(
            child: Text(
              "Game Over\nTap to Restart",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          )
      ],
    );
  }
}
