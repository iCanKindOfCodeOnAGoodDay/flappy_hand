import 'package:flappy_taco/constants.dart';
import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThingDeadDynamicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<SettingsDataProvider>().activatedSkeletonHand == true
        ? kThingDeadSkeleton
        : Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'images/${context.watch<SettingsDataProvider>().pathToSelectedDeadHand}'))),
          );
  }
}
