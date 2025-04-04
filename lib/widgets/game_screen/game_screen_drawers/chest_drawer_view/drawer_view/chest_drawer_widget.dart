import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flappy_taco/widgets/game_screen/game_screen_drawers/chest_drawer_view/chest/display_selected_items_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white10,
      // width: screenWidth / 2,
      child: ListView(
        children: [
          // Row(
          //   children: [
          //     Container(
          //       height: 100,
          //       width: 100,
          //       decoration: BoxDecoration(
          //           image: DecorationImage(
          //               fit: BoxFit.contain,
          //               image: AssetImage('images/UI_armory_black.png'))),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          Container(
            // color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'swipe to exit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          SelectionLabelTitles(title: "Equip Inventory Items"),

          Container(
            height: 400,
            width: screenWidth,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: context
                  .watch<SettingsDataProvider>()
                  .itemsWonThatAreAvailableToEquip,
            ),
          ),
          // DisplaySelectedItemsColumn(),

          SelectionLabelTitles(
            title: 'Want something new?',
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
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/UI_black_chest.png'),
                            fit: BoxFit.fill)),
                  )
                  // OpenableChest(), // replacing with just a chest for now
                  ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   color: Colors.black,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 100.0),
              //     child: Column(
              //       children: [
              //         GestureDetector(
              //           onTap: () {
              //             print('not allowing change to colorful hands');
              //           },
              //           child: Container(
              //             height: 150.0,
              //             width: 150.0,
              //             decoration: BoxDecoration(
              //                 image: DecorationImage(
              //                     image: AssetImage(
              //                         'images/${context.watch<SettingsDataProvider>().pathToSelectedWalkingHand}'))),
              //           ),
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Column(
              //               children: [
              //                 FlashingText(text: 'FIRE'),
              //                 FlashingText(text: 'Fishes'),
              //                 GestureDetector(
              //                   onTap: () {
              //                     context
              //                         .read<SettingsDataProvider>()
              //                         .setFish();
              //                   },
              //                   child: Icon(
              //                     Icons.arrow_circle_left_outlined,
              //                     size: 50.0,
              //                     color: Colors.orange,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 GestureDetector(
              //                   onTap: () {
              //                     print('not allowing colorful handss');
              //                     context
              //                         .read<SettingsDataProvider>()
              //                         .nextHandColor();
              //
              //                     /// now function only brings the regular hand back
              //                   },
              //                   child: Icon(
              //                     Icons.swap_calls,
              //                     size: 50.0,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 FlashingText(text: 'CHANGE'),
              //                 FlashingText(text: 'PLAYER'),
              //               ],
              //             ),
              //             Column(
              //               children: [
              //                 FlashingText(text: 'MEAN'),
              //                 FlashingText(text: 'Faces'),
              //                 GestureDetector(
              //                   onTap: () {
              //                     context
              //                         .read<SettingsDataProvider>()
              //                         .setFace();
              //                   },
              //                   child: Icon(
              //                     Icons.arrow_circle_right_outlined,
              //                     size: 50.0,
              //                     color: Colors.orange,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          SelectionLabelTitles(title: "what\'s in the box?"),
          SizedBox(
            height: 20,
          ),

          Container(
            height: 300,
            width: screenWidth,
            child: context.read<SettingsDataProvider>().displayAllWinnables(),
          ),
        ],
      ),
    );
  }
}
