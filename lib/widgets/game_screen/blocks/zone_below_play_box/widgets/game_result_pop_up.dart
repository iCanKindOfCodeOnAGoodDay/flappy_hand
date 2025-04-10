import 'package:flappy_taco/services/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/game_engine.dart';
import '../../../../../providers/settings_data.dart';

class GameResultsPopup extends StatelessWidget {
  const GameResultsPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SoundModel sound = SoundModel();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(
          //   width: 10,
          //   color: Colors.white12,
          // ),
          // borderRadius: BorderRadius.circular(10),
          // color: Colors.black,
          image: DecorationImage(
              fit: BoxFit.fill,
              opacity: 0.5,
              image: AssetImage('images/scifi_screen_black.png')),
        ),
        // height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'USER '.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Image(
                    fit: BoxFit.fill,
                    height: 20,
                    width: 80,
                    image: AssetImage('images/kills_word.png'),
                  ),
                  Text(
                    ' SPREE: 289'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Time Survived: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text(
                                '${(30 + context.watch<GameEngine>().secondsSurvived) - 30}',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Knives: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text('8',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Monsters hit: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text('8',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Time Survived: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text(
                                '${(30 + context.watch<GameEngine>().secondsSurvived) - 30}',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Knives: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text('8',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Monsters hit: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text('8',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Lives used: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text('8',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Grendades: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text('8',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Grendades: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                            Text('8',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.read<GameEngine>().jump();
                        },
                        child: Container(
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                              image: (DecorationImage(
                                  invertColors: true,
                                  colorFilter: ColorFilter.mode(
                                    Colors.green,
                                    BlendMode
                                        .modulate, // overlays red onto the image
                                  ),
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'images/UI_button_start.PNG')))),
                        )),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('images/icon_button_user.png'),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            sound.gameOver(true);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/icon_button_leaderboard.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<SettingsDataProvider>()
                          .openChestToGetRandomPrize();
                      context
                          .read<SettingsDataProvider>()
                          .handleOpenChestAnimation(); // questions?
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/icon_button_chest.png'),
                              fit: BoxFit.fill)),
                    ),
                    // OpenableChest(), // replacing with just a chest for now
                  ),
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('images/icon_button_settings.png')),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/icon_button_armory.png')),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
