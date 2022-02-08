import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neon/neon.dart';
import 'package:rashidwassan/pages/home/home.dart';
import 'package:rashidwassan/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigate() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  void initState() {
    _navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: LottieBuilder.asset(
                  Images.splashAnimation,
                  frameRate: FrameRate(60),
                ),
              ),
              const SizedBox(height: 16),
              Neon(
                text: 'Preparing...',
                color: Colors.purple,
                font: NeonFont.LasEnter,
                glowing: true,
                fontSize: 25,
                flickeringLetters: [1, 5, 8, 9, 10],
              )
            ],
          ),
        ),
      ),
    );
  }
}
