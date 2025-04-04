import 'package:flutter/material.dart';

class TransparentGridBlock extends StatelessWidget {
  Color color = Colors.red;
  TransparentGridBlock({required this.color});
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      color: color,
      size: 40.0,
    );
  }
}
