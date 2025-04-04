import '../enums/screen_effect_type.dart';

class ScreenEffect {
  final ScreenEffectType type;
  final String imagePath;
  final DateTime startTime;
  final Duration duration;

  ScreenEffect({
    required this.type,
    required this.imagePath,
    required this.duration,
  }) : startTime = DateTime.now();
}
