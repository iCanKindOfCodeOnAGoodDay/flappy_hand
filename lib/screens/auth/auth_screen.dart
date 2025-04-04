import 'package:flappy_taco/screens/game/game_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 100,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // height: 150,
                // width: 150,
                height: MediaQuery.of(context).size.width / 3,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/astronaut2.GIF'))),
              ),
              Container(
                // height: 150,
                // width: 150,
                height: MediaQuery.of(context).size.width / 5,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('images/zombie_1.GIF'))),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'AK47 in SPACE',
            style: TextStyle(color: Colors.greenAccent, fontSize: 30),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GamePlayScreen()));
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/continueWithAppleButton.png'))),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GamePlayScreen()));
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('images/continueWithGoogleButton.png'))),
            ),
          ),
          // Row(
          //   children: [
          //     Text(
          //       'email',
          //     ),
          //   ],
          // ),
          // TextField(),
          // Row(
          //   children: [
          //     Text(
          //       'password',
          //       // style: TextStyle(color: Colors.white),
          //     ),
          //   ],
          // ),
          // TextField(),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => SplashScreen()));
          //   },
          //   child: Container(
          //     height: 100,
          //     color: Colors.black,
          //     child: Center(
          //       child: Text(
          //         'login',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
