import 'package:flutter/material.dart';

class Obstacle {
  double x;
  double height;

  Obstacle({required this.x, required this.height});
}

ValueNotifier<List<Obstacle>> obstacles = ValueNotifier([]);
