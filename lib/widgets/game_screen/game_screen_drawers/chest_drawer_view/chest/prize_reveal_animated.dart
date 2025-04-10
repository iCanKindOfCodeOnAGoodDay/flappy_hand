import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// does nothing on pressed
/// you would have to call to get new item from the chest separately
///
/// has hardcoded size - cannot be used in multiple places easily
///
class PrizeRevealAnimated extends StatefulWidget {
  @override
  State<PrizeRevealAnimated> createState() => _PrizeRevealAnimatedState();
}

class _PrizeRevealAnimatedState extends State<PrizeRevealAnimated> {
  bool showResultRow = false;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showResultRow = true;
      });
      // showResultRow = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height;
    final double width;

    return Container(
      decoration: BoxDecoration(
          // image: DecorationImage(
          //     fit: BoxFit.contain,
          //     image: AssetImage('images/scifi_arcade_black_screen.png')),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// This is the chest
          Container(
              child: context
                          .watch<SettingsDataProvider>()
                          .shouldHideTheLastPrize ==
                      true
                  ? Container(
                      child: Hero(
                        tag: 'prize',
                        child: Container(
                          width: 100.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      'images/${context.watch<SettingsDataProvider>().pathToChangeChestImageFromClosedToOpen}'))),
                        ),
                      ),
                    )
                  : Container()),

          /// This is the Prize
          Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Hero(
                  tag: 'prize',
                  child: Container(
                    width: context
                                .watch<SettingsDataProvider>()
                                .shouldHideTheLastPrize ==
                            true
                        ? 0.0
                        : context
                            .watch<SettingsDataProvider>()
                            .chestAnimationWidth,
                    height: context
                                .watch<SettingsDataProvider>()
                                .shouldHideTheLastPrize ==
                            true
                        ? 0.0
                        : context
                            .watch<SettingsDataProvider>()
                            .chestAnimationHeight,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                                'images/${context.watch<SettingsDataProvider>().pathToNewItemFromChest}'))),
                  ),
                ),
              ],
            ),
          ),
          PrizeRevealResultRowIcons(showResultRow: showResultRow),
        ],
      ),
    );
  }
}

class PrizeRevealResultRowIcons extends StatelessWidget {
  const PrizeRevealResultRowIcons({
    super.key,
    required this.showResultRow,
  });

  final bool showResultRow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         fit: BoxFit.fill,
          //         image: AssetImage('images/scifi_arcade_black_screen_2.png'))),
          child: showResultRow == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<SettingsDataProvider>()
                                  .closeChestAndHideLastPrize();
                            },
                            child: Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<SettingsDataProvider>()
                                  .closeChestAndHideLastPrize();
                            },
                            child: Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'images/icon_button_equip.png'))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container()),
    );
  }
}
