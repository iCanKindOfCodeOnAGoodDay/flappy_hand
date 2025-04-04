import 'package:flutter/material.dart';

/*

March 2025,

Used in Splash Screen only
What file are we passing in? Are we mislabeling this widget,
Because it is spinning the grenades and not the zombie before the
launch to game view_box transition.

 */

class SpinningGrenadeForSplashScreenWidget extends StatefulWidget {
  String path = '';

  SpinningGrenadeForSplashScreenWidget({required this.path});

  @override
  _SpinningGrenadeForSplashScreenWidgetState createState() =>
      _SpinningGrenadeForSplashScreenWidgetState();
}

class _SpinningGrenadeForSplashScreenWidgetState
    extends State<SpinningGrenadeForSplashScreenWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/${widget.path}'))),
            ),
          ),
        ],
      ),
    );
  }
}
