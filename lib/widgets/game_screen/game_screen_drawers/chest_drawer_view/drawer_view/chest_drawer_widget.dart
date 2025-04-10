import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flappy_taco/widgets/game_screen/game_screen_drawers/chest_drawer_view/chest/display_selected_items_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../alien_screen_cover_animation.dart';

class ShopDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        AlienAnimationScreen(),
        Container(
          child: ListView(
            children: [
              SelectionLabelTitles(
                title: "Your Items click to equip",
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('images/icon_button_armory.png'),
                              fit: BoxFit.contain)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'swipe to exit',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Icon(
                                Icons.arrow_back,
                                size: 80,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 300,
                width: screenWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      context.watch<SettingsDataProvider>().userInventoryItems,
                ),
              ),
              // DisplaySelectedItemsColumn(),
              SelectionLabelTitles(
                title: 'What chest has waiting for you',
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                height: 300,
                width: screenWidth,
                child:
                    context.read<SettingsDataProvider>().displayAllWinnables(),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        context
                            .read<SettingsDataProvider>()
                            .openChestToGetRandomPrize();
                        context
                            .read<SettingsDataProvider>()
                            .handleOpenChestAnimation(); // questions?
                      },
                      child: Container(
                        // height: 200,
                        // width: 200,
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage('images/UI_black_chest.png'),
                        //         fit: BoxFit.contain)),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'images/icon_button_chest.png'),
                                        fit: BoxFit.fill)),
                              ),
                              Text(
                                'open chest to win prize',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
