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
      child:
          // Container(
          //   height: 200.0,
          //   width: 200.0,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           fit: BoxFit.contain, image: AssetImage('images/$path'))),
          // ),
          Column(
        children: [
          Container(
            height: 400.0,
            width: 400.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image:
                        AssetImage('images/scifi_arcade_black_screen_2.png'))),

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
          // Container(
          //   height: 200,
          //   width: screenWidth,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: List.generate(
          //         context
          //             .watch<SettingsDataProvider>()
          //             .itemsWonThatAreAvailableToEquip
          //             .length, (index) {
          //       return PremiumItems(
          //           type: type,
          //           path: context
          //               .read<SettingsDataProvider>()
          //               .itemsWonThatAreAvailableToEquip[index]
          //               .path);
          //     }),
          //   ),
          // ),
        ],
      ),
    );
  }
}
