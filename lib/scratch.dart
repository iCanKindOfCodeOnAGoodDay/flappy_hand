//
// GestureDetector(
//                             onTap: () {
//                               context
//                                   .read<GamePlayVariableDataProvider>()
//                                   .reloadGun2();
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: AssetImage(context
//                                                   .watch<
//                                                       GamePlayVariableDataProvider>()
//                                                   .fullyLoaded ==
//                                               true
//                                           ? 'images/UI_button_reload.PNG'
//                                           : context
//                                                       .watch<
//                                                           GamePlayVariableDataProvider>()
//                                                       .roundsInMagazine !=
//                                                   0
//                                               ? 'images/UI_button_reload.PNG'
//                                               : 'images/UI_button_reload.PNG'))),
//                               child: Container(
//                                 width: 70.0,
//                                 height: 70.0,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: kTransparent),
//                               ),
//                             ),
//                           ),
