import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedGrenadeWidget extends StatelessWidget {
  bool onScreenPickupAndNotAGrenadeButton;
  SelectedGrenadeWidget({required this.onScreenPickupAndNotAGrenadeButton});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: onScreenPickupAndNotAGrenadeButton == false ? 70.0 : 40.0,
      width: onScreenPickupAndNotAGrenadeButton == false ? 70.0 : 40.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                  'images/${context.watch<SettingsDataProvider>().grenadePath}'))),
    );
  }
}
