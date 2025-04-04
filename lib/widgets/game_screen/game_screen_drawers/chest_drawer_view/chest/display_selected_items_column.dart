import 'package:flappy_taco/widgets/game_screen/game_screen_drawers/chest_drawer_view/drawer_view/armory_selection_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/settings_data.dart';
import '../prizes/others_changes/winnable_gun.dart';

class DisplaySelectedItemsColumn extends StatelessWidget {
  const DisplaySelectedItemsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectionLabelTitles(
          title: 'Currently Selected Items',
        ),
        Container(
          height: 420,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              /// selected gun
              Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  PremiumItems(
                      path: context.read<SettingsDataProvider>().gunPath,
                      type: PremiumContentType.gat),
                ],
              ),

              /// selected grenade
              // SelectionLabelTitles(
              //   title: "Selected Grenade",
              // ),
              SizedBox(
                height: 10.0,
              ),

              PremiumItems(
                  path: context.read<SettingsDataProvider>().grenadePath,
                  type: PremiumContentType.grenade),

              // Selected Monster
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SelectionLabelTitles(title: "Selected monster"), // "monster"
                  SizedBox(
                    height: 10.0,
                  ),
                  ArmoryItemWidgets(
                      path: context.read<SettingsDataProvider>().monsterPath),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),

              /// selected knife
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SelectionLabelTitles(title: "Selected knife"),
                  SizedBox(
                    height: 10.0,
                  ),
                  ArmoryItemWidgets(
                      path: context
                          .read<SettingsDataProvider>()
                          .pathToSelectedKnife),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectionLabelTitles extends StatelessWidget {
  String title;
  SelectionLabelTitles({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          // height: 500,
          // width: 100,
          decoration: BoxDecoration(
              // color: Colors.black,
              // border: Border(top: BorderSide(color: Colors.white, width: 3.0)),

              // image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage('images/ledScreenBackground.jpg')),
              // borderRadius: BorderRadius.circular(10.0),
              ),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                        'images/cyber_black_game_screen_black_mono.png'))),
            // color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Container(
                  // color: Colors.black54,
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
