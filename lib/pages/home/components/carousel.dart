import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/pages/home/components/carousel_items.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:async';

class Carousel extends StatefulWidget {
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with TickerProviderStateMixin {
  //Initializing

  AnimationController _flutterFLoatController;
  AnimationController _imageAnimationController;
  Animation _flutterIconAnimation;
  Animation _mainImageAnimation;
  List<String> _tech;
  int _currentTech = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flutterFLoatController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _imageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _flutterIconAnimation = CurvedAnimation(
        parent: _flutterFLoatController,
        curve: Curves.elasticIn,
        reverseCurve: Curves.bounceOut);

    _mainImageAnimation = CurvedAnimation(
        parent: _imageAnimationController, curve: Curves.easeIn);

    _tech = [
      'assets/f3.png',
      'assets/m1.png',
      'assets/python.png',
      'assets/macos.png'
    ];

    Future.delayed(Duration(seconds: 3), () {
      _imageAnimationController.forward();
      _imageAnimationController.addListener(() {
        setState(() {});
      });

      _flutterFLoatController.forward();
      _flutterFLoatController.addListener(() {
        setState(() {});
      });
    });

    changeTechIcon();
  }

  @override
  void dispose() {
    super.dispose();
    _imageAnimationController.dispose();
    _flutterFLoatController.dispose();
  }

  Future changeTechIcon() async {
    while (true) {
      await new Future.delayed(const Duration(seconds: 6), () {
        if (_flutterFLoatController.status == AnimationStatus.completed) {
          Future.delayed(Duration(seconds: 4));
          _flutterFLoatController.reverse();
        } else {
          _currentTech = (_currentTech + 1) % _tech.length;
          _flutterFLoatController.forward();
        }
      });
    }
  }

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                // autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
              items: List.generate(
                carouselItems.length,
                (index) => Builder(
                  builder: (BuildContext context) {
                    return Container(
                      constraints: BoxConstraints(
                        minHeight: carouselContainerHeight,
                      ),
                      child: ScreenHelper(
                        // Responsive views
                        desktop: _buildDesktop(
                          context,
                          carouselItems[index].text,
                          carouselItems[index].image,
                        ),
                        tablet: _buildTablet(
                          context,
                          carouselItems[index].text,
                          carouselItems[index].image,
                        ),
                        mobile: _buildMobile(
                          context,
                          carouselItems[index].text,
                          carouselItems[index].image,
                        ),
                      ),
                    );
                  },
                ),
              ).toList(),
            ),
          )
        ],
      ),
    );
  }

  List<CarouselItemModel> carouselItems = List.generate(
    5,
    (index) => CarouselItemModel(
      text: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "SOFTWARE DEVELOPER",
              style: GoogleFonts.oswald(
                color: kPrimaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            Text(
              "RASHID WASSAN",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Flutter & Python developer, based in Pakistan 🇵🇰",
              style: TextStyle(
                color: kCaptionColor,
                fontSize: 15.0,
                height: 1.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Wrap(
                children: [
                  Text(
                    "Wanna know more?",
                    style: TextStyle(
                      color: kCaptionColor,
                      fontSize: 15.0,
                      height: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchURL('https://www.instagram.com/rashidwassaan/');
                    },
                    child: MouseRegion(
                      onHover: (v) {},
                      child: Text(
                        " Got a project? Let's talk.",
                        style: TextStyle(
                          height: 1.5,
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              hoverElevation: 10,
              hoverColor: Colors.green,
              height: 48.0,
              color: kPrimaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () {},
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );

  // Big screens
  Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: kDesktopMaxWidth,
        minWidth: kDesktopMaxWidth,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(
              child: text,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Container(
                      child: Image.asset(
                        "assets/rashid.png",
                        opacity: _imageAnimationController,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(-3, 3),
                                blurRadius: 4,
                                spreadRadius: 0.1)
                          ],
                          color: Color(0xFFff03f7).withOpacity(0.9),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(
                          _tech[_currentTech],
                          height: _flutterIconAnimation.value * 90,
                          width: _flutterIconAnimation.value * 90,
                        ).p(5),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Mid screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kTabletMaxWidth,
      minWidth: kTabletMaxWidth,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

// SMall Screens

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMobileMaxWidth(context),
    ),
    width: double.infinity,
    child: text,
  );
}
