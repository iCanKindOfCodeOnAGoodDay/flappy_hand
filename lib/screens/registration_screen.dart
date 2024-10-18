import 'package:flappy_taco/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create account or login'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              // width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/mileySnoopNicholasCage.gif'))),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  'Google',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  'Apple',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                Text('email'),
              ],
            ),
            TextField(),
            Row(
              children: [
                Text('password'),
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
                color: Colors.black,
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
      ),
    );
  }
}
