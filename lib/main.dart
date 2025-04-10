import 'package:flappy_taco/providers/game_data.dart';
import 'package:flappy_taco/providers/game_engine.dart';
import 'package:flappy_taco/providers/settings_data.dart';
import 'package:flappy_taco/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  ///lock landscape mmode
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GamePlayVariableDataProvider()),
    ChangeNotifierProvider(create: (_) => SettingsDataProvider()),
    ChangeNotifierProvider(create: (_) => GameEngine()),
    ChangeNotifierProxyProvider2<GamePlayVariableDataProvider,
        SettingsDataProvider, GameEngine>(
      create: (_) => GameEngine(),
      update: (_, gameData, settings, gameEngine) =>
          gameEngine!..updateDependencies(gameData, settings),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: SplashScreen(),
        home: RegistrationScreen());
  }
}
