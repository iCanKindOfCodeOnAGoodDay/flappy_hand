import 'package:flappy_taco/screens/game/game_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.width,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/Cute_Alien_Knife.png'))),
              ),
              // Column(
              //   children: [
              //     SizedBox(height: 90),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 0.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Container(
              //             height: 70,
              //             width: 70,
              //             // height: MediaQuery.of(context).size.width,
              //             // width: MediaQuery.of(context).size.width,
              //             decoration: BoxDecoration(
              //                 image: DecorationImage(
              //                     fit: BoxFit.contain,
              //                     image: AssetImage(
              //                         'images/${context.watch<SettingsDataProvider>().pathSelectedPlayer}'))),
              //           ),
              //           // Container(
              //           //   height: 50,
              //           //   width: 90,
              //           //   // height: MediaQuery.of(context).size.width / 5,
              //           //   // width: MediaQuery.of(context).size.width / 5,
              //           //   decoration: BoxDecoration(
              //           //       image: DecorationImage(
              //           //           fit: BoxFit.contain,
              //           //           image: AssetImage(
              //           //               'images/${context.watch<SettingsDataProvider>().gunPath}'))),
              //           // ),
              //         ],
              //       ),
              //     ),
              //     SizedBox(
              //       height: 30,
              //     ),
              //     Column(
              //       children: [
              //         Container(
              //           height: 50,
              //           width: 50,
              //           // height: MediaQuery.of(context).size.width / 5,
              //           // width: MediaQuery.of(context).size.width / 5,
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   fit: BoxFit.fitHeight,
              //                   image: AssetImage(
              //                       'images/alien_antennas_chatGPTog.png'))),
              //         ),
              //         Container(
              //           height: 50,
              //           width: 50,
              //           // height: MediaQuery.of(context).size.width / 5,
              //           // width: MediaQuery.of(context).size.width / 5,
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   fit: BoxFit.fitHeight,
              //                   image: AssetImage(
              //                       'images/alien_antennas_chatGPTog.png'))),
              //         ),
              //         Container(
              //           height: 50,
              //           width: 50,
              //           // height: MediaQuery.of(context).size.width / 5,
              //           // width: MediaQuery.of(context).size.width / 5,
              //           decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   fit: BoxFit.fitHeight,
              //                   image: AssetImage(
              //                       'images/alien_antennas_chatGPTog.png'))),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            textAlign: TextAlign.center,
            'Space Aliens',
            style: TextStyle(color: Colors.black87, fontSize: 20),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GamePlayScreen()));
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/continueWithAppleButton.png'))),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GamePlayScreen()));
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('images/continueWithGoogleButton.png'))),
            ),
          ),
        ],
      ),
    );
  }
}
