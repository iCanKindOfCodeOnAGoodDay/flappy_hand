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
                      path: context.read<SettingsDataProvider>().shotgunPath),
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
  final String title;
  final Widget child;

  SelectionLabelTitles({
    required this.title,
    Widget? child,
  }) : this.child = child ?? Container();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            fit: BoxFit.fill,
            image: AssetImage('images/cyber_black_game_screen_black_mono.png'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 80.0,
            horizontal: 40,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
