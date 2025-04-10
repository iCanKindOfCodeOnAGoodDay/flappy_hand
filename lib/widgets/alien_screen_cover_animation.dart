import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AlienAnimationScreen extends StatefulWidget {
  final String imagePath;

  const AlienAnimationScreen({
    this.imagePath = 'images/Cute_Alien_Knife.png', // default
  });

  @override
  _AlienAnimationScreenState createState() => _AlienAnimationScreenState();
}

class _AlienAnimationScreenState extends State<AlienAnimationScreen>
    with SingleTickerProviderStateMixin {
  final int alienCount = 50;
  late AnimationController _controller;
  late List<Alien> aliens;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    final random = Random();
    aliens = List.generate(alienCount, (index) {
      final size = random.nextDouble() * 30 + 20;
      final x = random.nextDouble();
      final y = random.nextDouble();
      final delayFraction = random.nextDouble();

      return Alien(
        x: x,
        y: y,
        size: size,
        delayFraction: delayFraction,
        imagePath: widget.imagePath, // from parent
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cyber_black_game_screen_black_mono.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Stack(
              children: aliens.map((alien) {
                final left = alien.x * screenSize.width;
                final startY = -100.0;
                final endY = alien.y * screenSize.height;

                // Staggered drop timing
                final dropStart = alien.delayFraction;
                final dropDuration = 0.5;
                final dropEnd = dropStart + dropDuration;

                final t = ((_controller.value - dropStart) / dropDuration)
                    .clamp(0.0, 1.0);
                final easedT = Curves.easeOutCubic.transform(t);
                final top = lerpDouble(startY, endY, easedT)!;

                final scale = Curves.easeOutBack.transform(t);

                return Positioned(
                  left: left,
                  top: top,
                  child: Transform.scale(
                    scale: scale,
                    child: AlienWidget(
                      size: alien.size,
                      imagePath: alien.imagePath,
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class Alien {
  final double x;
  final double y;
  final double size;
  final double delayFraction;
  final String imagePath;

  Alien({
    required this.x,
    required this.y,
    required this.size,
    required this.delayFraction,
    required this.imagePath,
  });
}

class AlienWidget extends StatelessWidget {
  final double size;
  final String imagePath;

  const AlienWidget({
    required this.size,
    this.imagePath = 'images/Cute_Alien_Knife.png', // default image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 2,
      width: size * 2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
