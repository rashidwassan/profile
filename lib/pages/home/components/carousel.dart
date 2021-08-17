import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/dialogs.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';
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
  int _currentTech = 2;

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
      duration: Duration(seconds: 2),
    );

    _flutterIconAnimation = CurvedAnimation(
        parent: _flutterFLoatController,
        curve: Curves.elasticIn,
        reverseCurve: Curves.bounceOut);

    _mainImageAnimation = CurvedAnimation(
        parent: _imageAnimationController, curve: Curves.bounceInOut);

    _tech = [
      'assets/f3.png',
      'assets/m1.png',
      'assets/python.png',
      'assets/macos.png'
    ];

    Future.delayed(Duration(seconds: 2), () {
      _imageAnimationController.forward();
      _imageAnimationController.addListener(() {
        setState(() {});
      });

      // _flutterFLoatController.forward();
      // _flutterFLoatController.addListener(() {
      //   setState(() {});
      // });
    });

    // changeTechIcon();
  }

  @override
  void dispose() {
    _imageAnimationController.dispose();
    _flutterFLoatController.dispose();
    super.dispose();
  }

  Future changeTechIcon() async {
    int _currentCount = 0;
    while (true) {
      await new Future.delayed(const Duration(seconds: 1), () {
        if (_flutterFLoatController.status == AnimationStatus.completed) {
          _currentCount += 1;
          if (_currentCount == 4) {
            _flutterFLoatController.reverse();
            _currentCount = 0;
          }
        } else {
          if (_currentCount == 0) {
            _currentTech = (_currentTech + 1) % _tech.length;
            _flutterFLoatController.forward();
          }
        }
      });
    }
  }

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .80 : .85);
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
              style: TextStyle(
                fontFamily: 'Oswald',
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
              style: TextStyle(
                fontFamily: 'Oswald',
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  "Flutter & Python developer, based in Pakistan ",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 15.0,
                    height: 1.0,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset(
                    'assets/pk.jpeg',
                    height: 13,
                  ),
                ),
              ],
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
                      launchURL('https://www.linkedin.com/in/rashidwassan');
                    },
                    child: MouseRegion(
                      cursor: MouseCursor.defer,
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
              hoverColor: Colors.white24,
              height: 48.0,
              color: kPrimaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              onPressed: () async {
                // final Email email = Email(
                //   body: 'Hi there! Just wanted to say hi!',
                //   subject: 'Email from portfolio web',
                //   recipients: ['rashidwassaan@gmail.com'],
                //   // cc: ['cc@example.com'],
                //   // bcc: ['bcc@example.com'],
                //   //  attachmentPaths: ['/path/to/attachment.zip'],
                //   isHTML: false,
                // );

                // await FlutterEmailSender.send(email);
              },
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
            _buildMainImage()
          ],
        ),
      ),
    );
  }

  Expanded _buildMainImage() {
    return Expanded(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(
            "assets/rashid.png",
            opacity: _imageAnimationController,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 90,
            child: Opacity(
              // opacity: (_flutterFLoatController.value + 0.00001) % 1,
              opacity: _mainImageAnimation.value,
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(-3, 3),
                      blurRadius: 4,
                      spreadRadius: 0.1)
                ], color: Color(0xFFff03f7), shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(
                    _tech[_currentTech],
                    width: 90,
                    height: 90,
                    //   height: _flutterIconAnimation.value * 90,
                    //   width: _flutterIconAnimation.value * 90,
                  ).p(16),
                ),
              ),
            ),
          )
        ],
      ),
    );
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
            _buildMainImage(),
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
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            "assets/rashid.png",
            opacity: _imageAnimationController,
          ),
          Spacer(),
          24.heightBox,
          text,
        ],
      ),
    );
  }
}
