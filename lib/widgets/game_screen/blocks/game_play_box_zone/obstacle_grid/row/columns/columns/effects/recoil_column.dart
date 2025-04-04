import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../constants.dart';
import '../../elements/recoil/exploding_recoil_widget.dart';
import '../../elements/recoil/shells_recoil_widget.dart';

class RecoilEffectColumn extends StatelessWidget {
  int position = 6;
  RecoilEffectColumn({required this.position});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        position == 11
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 10
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 9
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 8
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 7
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 6
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 5
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 4
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 3
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 2
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
        position == 1
            ? context
                        .watch<SettingsDataProvider>()
                        .activatedShellCasingsInsteadOfSparks ==
                    false
                ? ExplodingRecoil()
                : ShellsRecoil()
            : Icon(
                Icons.circle,
                color: kBlankColor,
                size: 40.0,
              ),
      ],
    );
  }
}
