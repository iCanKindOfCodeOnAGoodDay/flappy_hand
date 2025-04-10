import 'package:flappy_taco/widgets/game_screen/blocks/zone_below_play_box/widgets/death_pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../enums/screen_effect_type.dart';
import '../../models/screen_effect.dart';
import '../../providers/game_engine.dart';
import '../../providers/settings_data.dart';
import '../../widgets/alien_screen_cover_animation.dart';
import '../../widgets/game_screen/blocks/game_play_box_zone/view_box/view_box/view_stack/play_box.dart';
import '../../widgets/game_screen/effects/two_x_wineffect_widgets.dart';
import '../../widgets/game_screen/game_screen_drawers/chest_drawer_view/drawer_view/chest_drawer_widget.dart';
import '../../widgets/game_screen/game_screen_drawers/settings_view/end_drawer_view/settings_end_drawer.dart';

/*

March 2025,

If we are going to show gifs during game at the bottom of the 'game',
we can add that here perhaps, or within one of the view_box's children

1

              First container widget is the background image of the game view_box,
              which is a retro game console.


2


              This widget is for an effect,
              which changes the retro device color rapidly
              to create an 'explosion' effect.



 3

              At the 'front layer' of our stack,
              we have the 3 building blocks
              of the game view_box.




 */
class GamePlayScreen extends StatefulWidget {
  @override
  State<GamePlayScreen> createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  @override
  void initState() {
    super.initState();
    // Delay to ensure we are not updating until after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final gameEngine = Provider.of<GameEngine>(context, listen: false);
      gameEngine.setupBackgroundAnimationImageList();
      gameEngine.gameLoopNew();
    });
    context.read<GameEngine>().setupBackgroundAnimationImageList();
  }

  @override
  ValueNotifier<bool> gameOverNotifier = ValueNotifier<bool>(false);

  Widget build(BuildContext context) {
    var watchGameEngine = context.watch<GameEngine>();

    return Scaffold(
      drawer: ShopDrawerWidget(),
      endDrawer: SettingsEndDrawerWidget(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            invertColors: true,
            fit: BoxFit.cover,
            image: AssetImage('images/cyber_black_game_screen_black_mono.png'),
          ),
        ),
        child: Container(
          // color: Colors.white10,
          child: Stack(
            children: [
              ValueListenableBuilder<List<ScreenEffect>>(
                valueListenable:
                    context.watch<GameEngine>().activeScreenEffects,
                builder: (context, effects, child) {
                  final isGameOverActive = effects.any(
                      (effect) => effect.type == ScreenEffectType.gameOver);
                  final isAsteroidActive = effects.any(
                      (effect) => effect.type == ScreenEffectType.asteroid);

                  final isGrenadeActive = effects
                      .any((effect) => effect.type == ScreenEffectType.grenade);
                  final isBombActive = effects
                      .any((effect) => effect.type == ScreenEffectType.bomb);
                  final isAcidActive = effects
                      .any((effect) => effect.type == ScreenEffectType.acid);
                  final isShotgunActive = effects
                      .any((effect) => effect.type == ScreenEffectType.shotgun);
                  final isMac10Active = effects
                      .any((effect) => effect.type == ScreenEffectType.mac10);
                  final isAmmoUpgradeActive = effects.any(
                      (effect) => effect.type == ScreenEffectType.ammoUpgrade);
                  final isLifeActive = effects
                      .any((effect) => effect.type == ScreenEffectType.life);

                  if (isGameOverActive) {
                    return AlienAnimationScreen(); // default alien
                  } else if (isAsteroidActive) {
                    final path = context
                        .watch<SettingsDataProvider>()
                        .pathToSelectedKnife;
                    return AlienAnimationScreen(imagePath: 'images/$path');
                  } else if (isGrenadeActive) {
                    return AlienAnimationScreen(
                        imagePath:
                            'images/${context.watch<SettingsDataProvider>().grenadePath}');
                  } else if (isBombActive) {
                    return AlienAnimationScreen(
                        imagePath: 'images/bomb_pickup_2.png');
                  } else if (isAcidActive) {
                    return AlienAnimationScreen(
                        imagePath: 'images/probe_patrol_UFO_lights.png');
                  } else if (isShotgunActive) {
                    return AlienAnimationScreen(
                        imagePath:
                            'images/${context.watch<SettingsDataProvider>().shotgunPath}');
                  } else if (isMac10Active) {
                    return AlienAnimationScreen(
                        imagePath: 'images/mac_10_flipped.png');
                  } else if (isAmmoUpgradeActive) {
                    return AlienAnimationScreen(
                        imagePath: 'images/fireBallXPurple.gif');
                  } else if (isLifeActive) {
                    return AlienAnimationScreen(
                      imagePath:
                          'images/${context.watch<SettingsDataProvider>().pathSelectedPlayer}',
                    );
                  } else {
                    return Container(); // nothingR
                  }
                },
              ),
              TwoXWinEffectWidgets(),
              Column(
                /*R

                At the 'front layer' of our stack,
                we have the 3 building blocks
                of the game screen.

                 */

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // CustomAppBar(),
                  //

                  SizedBox(
                    height: 15,
                  ),

                  GestureDetector(
                      onTap: () {
                        context.read<GameEngine>().jump();
                      },
                      child: PlayBoxOfRetroDevice()),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: DeathPopUpWidget(),
                  ),
                  //  everything below 'screen' on retro device
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
