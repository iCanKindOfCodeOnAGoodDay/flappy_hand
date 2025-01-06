import 'package:flappy_taco/providers/game_status_provider.dart';
import 'package:flappy_taco/providers/premium_content_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../combo_hits.dart';
import '../death_effect_column.dart';
import '../fireball_under_hand_column.dart';
import '../hand_column_widget.dart';

class GamePlayAreaWidget extends StatelessWidget {
  const GamePlayAreaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

        ///GAME play areas
        Stack(
      children: [
        ///GAME play areas
        ///frame, except for when the image on top has transparent properties.

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/ledScreenBackground.jpg')),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: context
                              .read<GameStatusProvider>()
                              .shouldDisplayLossALifeAndNotAGameOverAndNotAKnifeDefenseDueToBeingStabbed ==
                          true
                      ? AssetImage(
                          "images/jenniferLaurenceNo.GIF",
                          // 'images/blood2.gif',
                          // 'images/blood2LightBlue.gif',
                        )
                      // : context
                      //             .watch<GameStatusProvider>()
                      //             .showSkullBackground ==
                      //         true
                      //     ? AssetImage(
                      //         'images/${context.watch<PremiumContentProvider>().pathToSelectedBeast}')
                      : context
                                  .watch<GameStatusProvider>()
                                  .shouldDisplayTimeIncrease ==
                              true
                          ? AssetImage(
                              // 'images/IMG_7147_alien.GIF',
                              'images/ooooSharpBlackSpaceBright.gif',
                              // 'images/warpSpeedBlack.gif',
                              // 'images/crystalBallLargeScreen.gif',
                            )
                          : context
                                      .watch<GameStatusProvider>()
                                      .shouldDisplayKnifeDefense ==
                                  true
                              ? AssetImage(
                                  ///funny app icon face
                                  'images/IMG_6724_icon.PNG',
                                  // ///fun hand icon image
                                  //
                                  // 'images/IMG_6722_icon.PNG',
                                )
                              : context
                                          .read<GameStatusProvider>()
                                          .shouldDisplayBandaidPickup ==
                                      true
                                  ? AssetImage(

                                      ///fun hand icon image
                                      // 'images/winnerLadyFistPump.gif',
                                      'images/djangoLiondardoOne.gif'

                                      // 'images/blood2White2.gif',
                                      // ///pimp girl
                                      // 'images/IMG_6550_pimPGirl.PNG',
                                      // 'images/handGem1-23-23Eo.gif',
                                      )
                                  : context
                                              .watch<GameStatusProvider>()
                                              .crashed ==
                                          false
                                      // ? AssetImage('images/fire.gif')
                                      ? AssetImage(
                                          // 'images/purpleEnergyBlackLightened.gif')

                                          /// current background image is a 100% transparent 'image'
                                          'images/${context.watch<PremiumContentProvider>().pathToSelectedBackgroundImage}')

                                      // blackWater.gif
                                      : AssetImage('images/gameOver.GIF'),
                ),
              ),
              child: Container(
                decoration:
                    // context
                    //             .watch<GameStatusProvider>()
                    //             .shouldDisplayExplosion1 ==
                    //         true
                    //     ? BoxDecoration(
                    //         image: DecorationImage(
                    //             image: AssetImage('images/blackExplosion.gif')))
                    //     :

                    //blackRedYellowExplosion.gif
                    //x2ExplosionYellow.gifdsddssddsddddds
                    context
                                .watch<GameStatusProvider>()
                                .shouldDisplayExplosion2 ==
                            true
                        ? BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  // 'images/djangoFireJamieFoxTwo.gif',
                                  'images/deathStar150.gif',
                                  // 'images/explosionFlamesBrightRed.gif',
                                )))
                        : context
                                    .watch<GameStatusProvider>()
                                    .shouldDisplayExplosion1 ==
                                true
                            ? BoxDecoration(
                                image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/explosionFlames.gif'),
                              ))
                            : context
                                        .read<GameStatusProvider>()
                                        .shouldDisplayLossALifeAndNotAGameOverAndNotAKnifeDefenseDueToBeingStabbed ==
                                    true
                                ? BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'images/${context.watch<PremiumContentProvider>().pathToSelectedKnife}')))
                                : context
                                            .read<GameStatusProvider>()
                                            .shouldDisplayQuickLifePickup ==
                                        true
                                    ? BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              // 'images/taylorSwiftCelebration.gif',
                                              'images/${context.watch<GameStatusProvider>().pathToZombieHandReach}',
                                            )))
                                    : context
                                                .read<GameStatusProvider>()
                                                .shouldDisplayBandaidPickup ==
                                            true
                                        ? BoxDecoration()
                                        // ? BoxDecoration(
                                        //     image: DecorationImage(
                                        //         fit: BoxFit.fill,
                                        //         image: AssetImage(
                                        //             'images/christopherScottWhite.gif')))
                                        : context
                                                    .read<GameStatusProvider>()
                                                    .shouldDisplayBloodSplatQuick ==
                                                true
                                            ? BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                      'images/blood2.gif',
                                                      // 'images/blood2LightBlue.gif',
                                                    )))
                                            : context
                                                        .read<
                                                            GameStatusProvider>()
                                                        .shouldDisplayQuickHorror ==
                                                    true
                                                ? BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            'images/blood2.gif')))
                                                : BoxDecoration(),
                child: Container(
                  decoration: context
                              .read<GameStatusProvider>()
                              .shouldDisplayBandaidPickup ==
                          true
                      ? BoxDecoration()
                      : context
                                  .read<GameStatusProvider>()
                                  .shouldDisplayLossALifeAndNotAGameOverAndNotAKnifeDefenseDueToBeingStabbed ==
                              true
                          ? BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'images/${context.watch<PremiumContentProvider>().pathToSelectedKnife}')))
                          : context
                                      .watch<GameStatusProvider>()
                                      .showSkullBackground ==
                                  true
                              ? BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        // 'images/IMG_7151_monsters.GIF',
                                        'images/zendyaFour.GIF',
                                        // 'images/mmZombieChargeInvertRed.gif',
                                      )))
                              : BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    /// buildlings
                    children: context.watch<GameStatusProvider>().buildings,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: context
                        .watch<GameStatusProvider>()
                        .shouldDisplayJustPickedUpCannon ==
                    true
                ? context.watch<GameStatusProvider>().rotatingIceCreamPickups
                : []),

        Container(
          // color: Colors.red,
          child: DeadEffectColumn(

              /// taco position widget
              position: context.watch<GameStatusProvider>().handPosition),
        ),
        Container(
          // color: Colors.red,
          child: context.watch<GameStatusProvider>().isClimbing == true
              ? CoinsUnderHandColumn(

                  /// taco position widget
                  position: context.watch<GameStatusProvider>().handPosition)
              : Container(),
        ),
        Container(
          // color: Colors.red,
          child: HandColumn(

              /// taco position widget
              position: context.watch<GameStatusProvider>().handPosition),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(context.watch<GameStatusProvider>().progressMessage,
                style: kMessageStyle)
          ],
        ),
        Row(
          children: context.watch<GameStatusProvider>().hellFireColumns,
        ),

        Row(
          children: context.watch<GameStatusProvider>().contactGrid,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ComboHitsMessage(),
          ],
        ),
      ],
    );
  }
}
