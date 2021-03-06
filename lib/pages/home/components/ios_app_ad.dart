import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rashidwassan/utils/apps.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:rashidwassan/utils/screen_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class IosAppAd extends StatefulWidget {
  @override
  State<IosAppAd> createState() => _IosAppAdState();
}

class _IosAppAdState extends State<IosAppAd> {
  int _currentApp = 0;
  int _currentAppPage = 0;

  void _nextApp() {
    setState(() {
      _currentApp = (_currentApp + 1) % apps.length;
      // _currentAppPage = 0;
    });
  }

  void _prevApp() {
    setState(() {
      _currentApp = (_currentApp - 1) % apps.length;
      // _currentAppPage = 0;
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
    print('iosAPP UI Build');
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
                      child: Container(
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: 2, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  spreadRadius: 2,
                                  blurRadius: 8)
                            ]),
                        child: AspectRatio(
                          aspectRatio: 9 / 19.5,
                          child: Stack(
                            //    alignment: Alignment.bottomCenter,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: SizedBox(
                                    width: constraints.maxWidth > 720.0
                                        ? null
                                        : 350.0,
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
                                            'assets/projectSnapshots/${apps[_currentApp].id}/$_currentAppPage.png',
                                          );
                                        },
                                      ),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
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
                                          Colors.black.withOpacity(0.5),
                                          Colors.black87
                                        ]),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      child: IconButton(
                                        iconSize: 32,
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(
                                            CupertinoIcons.arrow_left_circle,
                                            color: Colors.white),
                                        onPressed: () => _prevAppPage(),
                                      ),
                                    ),
                                    new DotsIndicator(
                                      dotsCount: 5,
                                      position: _currentAppPage.toDouble(),
                                      decorator: DotsDecorator(
                                        size: const Size.square(8.0),
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
                                ).p(16),
                              ),
                            ],
                          ),
                        ),
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
                          style: TextStyle(
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
                          style: TextStyle(
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
                              child: SizedBox(
                                height: 50,
                                child: TextButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 24)),
                                    elevation: MaterialStateProperty.all(12),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    backgroundColor: MaterialStateProperty.all(
                                        kPrimaryColor),
                                    shadowColor: MaterialStateProperty.all(
                                        kPrimaryColor.withOpacity(0.6)),
                                  ),
                                  onPressed: () => _prevApp(),
                                  child: Text(
                                    "PREVIOUS APP",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
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
                                hoverColor: Colors.white,
                                hoverElevation: 8,
                                highlightColor: Colors.white,
                                onPressed: () => _nextApp(),
                                height: 55.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
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
                            if (constraints.maxWidth > 720.0)
                              Flexible(child: SizedBox())
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
