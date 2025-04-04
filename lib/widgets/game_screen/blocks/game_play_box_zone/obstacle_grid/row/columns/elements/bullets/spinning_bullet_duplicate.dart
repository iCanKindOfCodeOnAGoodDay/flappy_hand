import 'package:flutter/material.dart';

class RotatingBullet2 extends StatefulWidget {
  String path = '';
  double height = 40.0;
  double width = 40.0;
  RotatingBullet2(
      {required this.path, required this.height, required this.width});

  @override
  _RotatingBullet2State createState() => _RotatingBullet2State();
}

class _RotatingBullet2State extends State<RotatingBullet2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(microseconds: 500),
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
              height: widget.height,
              width: widget.width,
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
