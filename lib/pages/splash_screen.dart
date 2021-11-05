import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:rashidwassan/pages/home/home.dart';
import 'package:rashidwassan/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  _animateLogo() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  _navigate() {
    Future.delayed(Duration(seconds: 30000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
    _animateLogo();
    _navigate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.purple.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 48)
                    ]),
                child: Image.asset(
                  'assets/rashid.png',
                  width: _animation.value * (context.percentWidth * 25),
                ),
              ).p(_animation.value * 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Made with',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Flexible(
                  child: LottieBuilder.asset(
                    'assets/flutter_anim.json',
                    height: 15,
                  ).px(8),
                ),
                Text(
                  'with ',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 17,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
