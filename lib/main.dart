import 'package:flappy_taco/providers/game_status_provider.dart';
import 'package:flappy_taco/providers/premium_content_provider.dart';
import 'package:flappy_taco/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  ///lock landscape mmode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => GameStatusProvider()),
    ChangeNotifierProvider(create: (_) => PremiumContentProvider()),
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
