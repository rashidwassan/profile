import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/utils/constants.dart';

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
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  _navigate() {
    Future.delayed(Duration(seconds: 40), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    //  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
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
    return Material(
      color: kBackgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Material(
                color: Colors.white.withOpacity(0.9),
                elevation: 12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(500)),
                child: Image.asset(
                  'assets/rashid.png',
                  width: _animation.value * (context.percentWidth * 20),
                ).p(_animation.value * 16),
              ).p(24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Made with',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Flexible(
                  child: LottieBuilder.asset(
                    'assets/flutter_anim.json',
                    height: 14,
                  ).px(16),
                ),
                Text(
                  'with ',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Flexible(
                  child: LottieBuilder.asset(
                    'assets/heart.json',
                    height: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
