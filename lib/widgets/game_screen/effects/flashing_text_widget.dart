import 'dart:async';

import 'package:flutter/material.dart';

class FlashingText extends StatefulWidget {
  String text;
  FlashingText({required this.text});

  @override
  State<FlashingText> createState() => _FlashingTextState();
}

class _FlashingTextState extends State<FlashingText> {
  bool isDarkTheme = true;

  // bool justWon = false;

  Color textColor = Colors.lightGreenAccent;

  @override
  void initState() {
    super.initState();
    fireMenuColorFlashAnimation();
  }

  void fireMenuColorFlashAnimation() {
    //  On Win, turn justWon on... set state Color variable, turn justWon off.
    setState(() {
      // isWinningColorShowChanging = approvedBackgroundColorList[0];
      textColor = Colors.lightGreenAccent;
    });

    const twoSec = Duration(milliseconds: 1200);
    Timer _menuFlashTimer =
        Timer.periodic(twoSec, (Timer t) => fireMenuColorFlashAnimation());

    Future.delayed(
      const Duration(milliseconds: 1200),
      () {
        _menuFlashTimer.cancel();
      },
    );

    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        setState(() {
          textColor = Colors.pink;
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        setState(() {
          textColor = Colors.orangeAccent;
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 600),
      () {
        setState(() {
          textColor = Colors.lightGreenAccent;
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        setState(() {
          textColor = Colors.pink;
        });
      },
    );
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        setState(() {
          textColor = Colors.orangeAccent;
        });
      },
    );

    // when animation is finished, turn shouldPlayColorFlash to false and set color back to default
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor,
              // fontFamily: ('HennyPenny'),
              fontSize: 40.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
