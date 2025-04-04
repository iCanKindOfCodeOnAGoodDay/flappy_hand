// import 'dart:async';
//
// import 'package:flappy_taco/constants.dart';
// import 'package:flappy_taco/providers/game_data.dart';
// import 'package:flappy_taco/services/audio_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../widgets/auth_transition_widgets/spinning_grenade_for_splash_screen_widget.dart';
// import '../game/game_screen.dart';
//
// /*
//
// March 2025,
//
// Navigate in, Navigate out.  Login transition.
//
// This is the transition view_box from login
// then navigates to game play view_box.
//
//
//
// THIS SCREEN NOT BEING USED
//
//  */
//
// SoundModel soundModel = SoundModel(); // we are not using the sound model ?
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   initState() {
//     super.initState();
//
//     // depends on game default values
//     if (context.read<GamePlayVariableDataProvider>().hearSoundEffects == true) {
//       soundModel.playOtherSounds('cannonUpgrade.mp3', true);
//       soundModel.playWarningAlarm(true);
//     }
//     Timer flappyHandSoundsTimer = Timer(Duration(seconds: 5), () {
//       soundModel.warningAlarm(true);
//     });
//     Timer transitionTimer = Timer(Duration(seconds: 3), () {
//       if (context.read<GamePlayVariableDataProvider>().hearSoundEffects ==
//           true) {
//         soundModel.playOtherSounds5x('customExplosion.mp3', true);
//       }
//       // context.read<GamePlayVariableDataProvider>().displayExplosionEffect1();
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (BuildContext context) {
//             return GamePlayScreen();
//           },
//         ),
//       );
//     });
//
//     void replaceBlankIconsWithZombieCards() {
//       for (var i = 0; i < 13; i++) {
//         /// replace 13 blank icons by removing the blank icon at the end
//         /// every 200th of a seconds
//         int delay = i * 200;
//         Timer(Duration(milliseconds: delay), () {
//           listOfIconsToBeReplacedByZombieCards
//               .removeAt(listOfIconsToBeReplacedByZombieCards.length - 1);
//           listOfIconsToBeReplacedByZombieCards.insert(
//               0,
//               (Expanded(
//                 child: SpinningGrenadeForSplashScreenWidget(
//                   path: "standardGrenade1-18-23GreenRed.png",
//                 ),
//               )));
//           setState(() {});
//
//           // update the interface 13 times
//         });
//       }
//     }
//
//     replaceBlankIconsWithZombieCards();
//   }
//
//   List<Widget> listOfIconsToBeReplacedByZombieCards = [
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//     kblankIcon,
//   ];
//
//   String imageFileName = "consumeJesus-unscreen.gif";
//   String fireBallPathTop = 'consumeJesus-unscreen.gif';
//   String fireBallPathBottom = 'mmjakFuzzyInvertPink.gif';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               fit: BoxFit.fitWidth,
//               image: AssetImage('images/space_zombie_background_square.PNG')),
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // SizedBox(
//               //   height: 40,
//               // ),
//               // Center(
//               //   child: Text(
//               //     "Space Zombies",
//               //     style: TextStyle(
//               //         color: Colors.black,
//               //         fontWeight: FontWeight.bold,
//               //         fontSize: 40.0),
//               //   ),
//               // ),
//
//               Expanded(
//                 child: Hero(
//                   tag: 'fireBall',
//                   child: Center(),
//                 ),
//               ),
//
//               SizedBox(
//                 height: 60,
//               ),
//
//               Container(
//                 // height: 40.0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: listOfIconsToBeReplacedByZombieCards,
//                 ),
//               ),
//               // Container(
//               //   // height: 40.0,
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.end,
//               //     children: listOfIconsToBeReplacedByZombieCards,
//               //   ),
//               // ),
//               // Container(
//               //   // height: 40.0,
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.end,
//               //     children: listOfIconsToBeReplacedByZombieCards,
//               //   ),
//               // ),
//               // Container(
//               //   // height: 40.0,
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.end,
//               //     children: listOfIconsToBeReplacedByZombieCards,
//               //   ),
//               // ),
//               // Container(
//               //   // height: 40.0,
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.end,
//               //     children: listOfIconsToBeReplacedByZombieCards,
//               //   ),
//               // ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
