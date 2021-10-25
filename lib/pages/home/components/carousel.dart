import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rashidwassan/models/carousel_item_model.dart';
import 'package:rashidwassan/pages/home/components/cv_section.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:rashidwassan/utils/screen_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class Carousel extends StatefulWidget {
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  //Initializing
  // AnimationController _imageAnimationController;
  // Animation _mainImageAnimation;

  @override
  void initState() {
    super.initState();

    // _imageAnimationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 2),
    // );

    // _mainImageAnimation = CurvedAnimation(
    //     parent: _imageAnimationController, curve: Curves.bounceInOut);
    // Future.delayed(Duration(seconds: 2), () {
    //   _imageAnimationController.forward();
    //   _imageAnimationController.addListener(() {
    //     setState(() {});
    //   });

    // _flutterFLoatController.forward();
    // _flutterFLoatController.addListener(() {
    //   setState(() {});
    // });
    // });

    // changeTechIcon();
  }

  @override
  void dispose() {
    // _imageAnimationController.dispose();
    super.dispose();
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
            SizedBox(
              height: 50,
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 32)),
                  elevation: MaterialStateProperty.all(12),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  shadowColor:
                      MaterialStateProperty.all(kPrimaryColor.withOpacity(0.6)),
                ),
                onPressed: () {
                  launchURL('https://www.linkedin.com/in/rashidwassan');
                },
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
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
      child: Hero(
        tag: 'mainAvatarImg',
        child: Image.asset(
          "assets/rashid.png",
          // opacity: _imageAnimationController,
          fit: BoxFit.cover,
        ),
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
          Expanded(
            child: Image.asset(
              "assets/rashid2.png",
              //   opacity: _imageAnimationController,
            ).p(24),
          ),
          24.heightBox,
          text,
          24.heightBox,
        ],
      ),
    );
  }
}
