import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:neon/neon.dart';
import 'package:velocity_x/velocity_x.dart';
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
    // _navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 1, end: 200),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.bounceIn,
              builder: (context, val, child) => LottieBuilder.asset(
                Images.skillAnim,
                frameRate: FrameRate(60),
                height: val,
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
    );
  }
}
