// import 'package:flappy_taco/widgets/game_screen/blocks/game_play_box_zone/obstacle_grid/row/columns/columns/player/player_column.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../../../../constants.dart';
// import '../../../../../../../../providers/game_data.dart';
// import 'effects/death_effect_column.dart';
// import 'effects/recoil_column.dart';
//
// /*
//
// not currently implemented in new game screen
//  */
//
// class GameStackElements extends StatelessWidget {
//   const GameStackElements({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         /// blood effect tracks player position on screen
//         Container(
//           child: DeadEffectColumn(
//               position:
//                   context.watch<GamePlayVariableDataProvider>().playerPosition),
//         ),
//
//         /// recoil effect tracks player position on screen
//         Container(
//           child:
//               context.watch<GamePlayVariableDataProvider>().isClimbing == true
//                   ? RecoilEffectColumn(
//                       position: context
//                           .watch<GamePlayVariableDataProvider>()
//                           .playerPosition)
//                   : Container(),
//         ),
//
//         /// TODO profile bug may come from this widget
//         /// player movement simulated on screen
//         PlayerColumn(
//             position:
//                 context.watch<GamePlayVariableDataProvider>().playerPosition),
//
//         /// text - progress updates
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(context.watch<GamePlayVariableDataProvider>().progressUpdate,
//                 style: kMessageStyle)
//           ],
//         ),
//
//         /// right to left movement simulated on screen
//         Row(
//           children:
//               context.watch<GamePlayVariableDataProvider>().gunShotColumns,
//         ),
//
//         /// right to left movement simulated on screen
//         Row(
//           children: context
//               .watch<GamePlayVariableDataProvider>()
//               .bulletZombieContactGrid,
//         ),
//       ],
//     );
//   }
// }
