// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flappy_taco/providers/game_data.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class TextWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     const colorizeColors = [
//       Colors.purple,
//       Colors.blue,
//       Colors.yellow,
//       Colors.red,
//     ];
//
//     const colorizeTextStyle = TextStyle(
//       fontSize: 50.0,
//       fontFamily: 'Horizon',
//     );
//
//     return SizedBox(
//       width: 250.0,
//       child: AnimatedTextKit(
//         animatedTexts: [
//           ColorizeAnimatedText(
//             context.watch<GamePlayVariableDataProvider>().progressUpdate,
//             textStyle: colorizeTextStyle,
//             colors: colorizeColors,
//           ),
//         ],
//         isRepeatingAnimation: true,
//         onTap: () {
//           print("Tap Event");
//         },
//       ),
//     );
//   }
// }
