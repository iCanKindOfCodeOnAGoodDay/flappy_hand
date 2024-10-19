import 'package:flappy_taco/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              height: 300,
              // width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/mileySnoopNicholasCage.gif'))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/continueWithAppleButton.png'))),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/continueWithGoogleButton.png'))),
          ),
          Row(
            children: [
              Text(
                'email',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          TextField(),
          Row(
            children: [
              Text(
                'password',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          TextField(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashScreen()));
            },
            child: Container(
              height: 100,
              color: Colors.red,
              child: Center(
                child: Text(
                  'login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
