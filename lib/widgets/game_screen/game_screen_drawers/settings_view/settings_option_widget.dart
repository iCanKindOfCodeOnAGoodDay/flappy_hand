import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/settings_data.dart';

class SettingOption extends StatelessWidget {
  bool arg;
  String label;
  Function() onTap;

  SettingOption({
    required this.arg,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20.0),
            // color: Colors.white38,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    'images/cyber_black_game_screen_black_mono.png'))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: context
                            .watch<SettingsDataProvider>()
                            .activatedExplodingAmmo ==
                        false
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'activate',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black,
                              // fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border:
                                Border.all(color: Colors.white, width: 3.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'on',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
