import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/utils/apps.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class IosAppAd extends StatefulWidget {
  @override
  State<IosAppAd> createState() => _IosAppAdState();
}

class _IosAppAdState extends State<IosAppAd> {
  int _currentApp = 0;
  int _currentAppPage = 1;

  void _nextApp() {
    setState(() {
      _currentApp = (_currentApp + 1) % apps.length;
      _currentAppPage = 0;
    });
  }

  void _prevApp() {
    setState(() {
      _currentApp = (_currentApp - 1) % apps.length;
      _currentAppPage = 0;
    });
  }

  void _nextAppPage() {
    setState(() {
      _currentAppPage = (_currentAppPage + 1) % 5;
    });
  }

  void _prevAppPage() {
    setState(() {
      _currentAppPage = (_currentAppPage - 1) % 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Padding(
                      padding: constraints.maxWidth > 720.0
                          ? EdgeInsets.symmetric(horizontal: 70)
                          : EdgeInsets.only(left: 16, right: 16, bottom: 32),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: SizedBox(
                                width:
                                    constraints.maxWidth > 720.0 ? null : 350.0,
                                child: AspectRatio(
                                  aspectRatio: 9 / 19.5,
                                  child: PageView.builder(
                                    onPageChanged: (page) =>
                                        (page < _currentAppPage)
                                            ? _prevAppPage()
                                            : _nextAppPage(),
                                    controller: PageController(
                                      initialPage: 0,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Image.asset(
                                        'assets/${apps[_currentApp].id}/$_currentAppPage.png',
                                      );
                                    },
                                  ),
                                ),
                              )),
                          Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.6),
                                    Colors.black87
                                  ]),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: IconButton(
                                    iconSize: 32,
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(CupertinoIcons.arrow_left_circle,
                                        color: Colors.white),
                                    onPressed: () => _prevAppPage(),
                                  ),
                                ),
                                new DotsIndicator(
                                  dotsCount: 5,
                                  position: _currentAppPage.toDouble(),
                                  decorator: DotsDecorator(
                                    size: const Size.square(9.0),
                                    activeColor: Colors.white,
                                    activeSize: const Size(18.0, 9.0),
                                    activeShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                ),
                                Flexible(
                                  child: IconButton(
                                    iconSize: 32,
                                    padding: EdgeInsets.all(0),
                                    icon: Icon(
                                      CupertinoIcons.arrow_right_circle,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => _nextAppPage(),
                                  ),
                                ),
                              ],
                            ).p(16).pOnly(bottom: 5),
                          ),

                          // Container(
                          //   color: Colors.black54,
                          //   child: AspectRatio(
                          //     aspectRatio: 9 / 19.6,
                          //     child: Center(
                          //       child: Text(
                          //         'Please swipe or click any arrow button to navigate betweeen images',
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 20,
                          //         ),
                          //       ).p(16),
                          //     ),
                          //   ),
                          // )

                          // Image.asset(
                          //   "assets/ios.png",
                          //   // Set width for image on smaller screen
                          //   width: constraints.maxWidth > 720.0 ? null : 350.0,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MOBILE APP",
                          style: GoogleFonts.oswald(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          apps[_currentApp].name,
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 35.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          apps[_currentApp].description,
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: MaterialButton(
                                color: kPrimaryColor,
                                hoverElevation: 8,
                                onPressed: () => _prevApp(),
                                height: 55.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 28.0),
                                    child: Text(
                                      "PREVIOUS APP",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Flexible(
                              child: MaterialButton(
                                hoverColor: Colors.white30,
                                hoverElevation: 8,
                                onPressed: () => _nextApp(),
                                height: 55.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 28.0),
                                    child: Text(
                                      "NEXT APP",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
