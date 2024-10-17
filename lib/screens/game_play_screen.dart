import 'package:flappy_taco/providers/game_status_provider.dart';
import 'package:flappy_taco/providers/premium_content_provider.dart';
import 'package:flappy_taco/screens/end_drawer_account_and_settings_widget.dart';
import 'package:flappy_taco/screens/shop_drawer_widget.dart';
import 'package:flappy_taco/widgets/screen_building_blocks/game_controls_widgets.dart';
import 'package:flappy_taco/widgets/screen_building_blocks/game_play_area.dart';
import 'package:flappy_taco/widgets/screen_building_blocks/power_up_widgets_lives_and.dart';
import 'package:flappy_taco/widgets/screen_building_blocks/top_screen_controls_and_score_widgets.dart';
import 'package:flappy_taco/widgets/two_x_wineffect_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ShopDrawerWidget(),
      endDrawer: EndDrawerCustomWidget(),
      // backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                // 'images/horseRidingPeople.gif',
                // 'images/phoneInternalsBlack.PNG',
                'images/black.png',
              )),
        ),
        child: Stack(
          children: [
            ////todo top of the screen above game play area
            // TopScreenWidgets(),

            ///todo this is the bottom screen below the game control buttons
            // BottomOfTheScreenImages(),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      context.watch<GameStatusProvider>().purpleGameBoy == true
                          ? 'images/futuristicGameConsoleNoLogo2BLANKLOGO copy 3.png'
                          : context.watch<GameStatusProvider>().silverGameBoy ==
                                  true
                              ? 'images/dotSquashGameConsoleGrey.png'
                              : context
                                          .watch<GameStatusProvider>()
                                          .redGameBoyInsteadOfYellow ==
                                      false
                                  ? 'images/dotSquashGameConsoleWhiteInvert.png'
                                  // ? 'images/redChip.jpg'
                                  : 'images/dotSquashGameConsoleSilver.png',
                    )),
              ),
            ),
            Opacity(
              opacity: context
                          .watch<GameStatusProvider>()
                          .shouldDisplayDoublePointsEffects ==
                      false
                  ? 1.0
                  : context.watch<GameStatusProvider>().opacityOfBlackGameBoy,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        // 'images/futuristicGameConsoleNoLogo2BLANKLOGO copy 3.png',
                        'images/${context.watch<PremiumContentProvider>().pathToSelectedGameConsole}',
                      )),
                ),
              ),
            ),

            /// top of tv stand
            // TopOfGameboyWidgets(),
            // BottomOfGameboyWidgets(),
            TwoXWinEffectWidgets(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),

                /// this is the bottom screen shittttt
                TopOfScreenControlsAndScoreWidgets(),
                GamePlayAreaWidget(),

                GameControlsWidgets(),

                SecondPowerUps(),
                // SizedBox(
                //   height: 10.0,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
