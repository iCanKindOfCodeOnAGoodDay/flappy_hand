import 'package:flutter/material.dart';

class Ammo extends StatefulWidget {
  String path;
  double height;
  double width;
  Ammo({required this.path, required this.height, required this.width});

  @override
  _AmmoState createState() => _AmmoState();
}

class _AmmoState extends State<Ammo> with SingleTickerProviderStateMixin {
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
