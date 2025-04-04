import 'package:flappy_taco/constants.dart';
import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HandWalkingLeftWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.read<SettingsDataProvider>().activatedSkeletonHand == true
        ? kThingWalkingLeftSkeletonOnly
        : kThingWalkingLeftSkeletonAndSkinCombo;
  }
}
