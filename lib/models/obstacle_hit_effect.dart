class ObstacleHitEffect {
  double xOffset; // relative to obstacle.x
  double y;
  String imagePath;
  Duration duration;
  int obstacleIndex;

  ObstacleHitEffect({
    required this.obstacleIndex,
    required this.xOffset,
    required this.y,
    required this.imagePath,
    required this.duration,
  });
}
