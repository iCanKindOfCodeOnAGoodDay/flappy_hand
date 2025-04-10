import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../providers/settings_data.dart';

class PremiumItems extends StatelessWidget {
  String path;
  PremiumContentType type;

  PremiumItems({required this.path, required this.type});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        context
            .read<SettingsDataProvider>()
            .handleAnimationWhenSelectingAnItemFromList(path);
        if (type == PremiumContentType.gat) {
          context.read<SettingsDataProvider>().changeGun('$path');
        } else if (type == PremiumContentType.grenade) {
          context.read<SettingsDataProvider>().changeGrenade('$path');
        } else if (type == PremiumContentType.beast) {
          context.read<SettingsDataProvider>().changeBeast('$path');
        } else if (type == PremiumContentType.shank) {
          context.read<SettingsDataProvider>().changeKnife('$path');
        } else if (type == PremiumContentType.console) {
          context.read<SettingsDataProvider>().changeConsole('$path');
        } else if (type == PremiumContentType.rocket) {
          context.read<SettingsDataProvider>().changeRocket('$path');
        }
      },
      child: Column(
        children: [
          Container(
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.5,
                    invertColors: true,
                    fit: BoxFit.contain,
                    image: AssetImage('images/scifi_screen_black.png'))),

            // Container(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/$path'))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
