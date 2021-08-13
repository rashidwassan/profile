import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/header_item.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/home.dart';
import 'package:web_portfolio/pages/testimonials_page.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "RW",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HeaderItem> desktopHeaderItems = [
      HeaderItem(
        title: "HOME",
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      ),
      HeaderItem(title: "MY INTRO", onTap: () {}),
      HeaderItem(title: "SERVICES", onTap: () {}),
      HeaderItem(title: "PORTFOLIO", onTap: () {}),
      HeaderItem(
          title: "TESTIMONIALS",
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Home(child: TestimonialsPage())));
          }),
      HeaderItem(
          title: "ARTICLES",
          onTap: () {
            launchURL('https://medium.com/@rashidwassaan');
          }),
      HeaderItem(
        title: "HIRE ME",
        onTap: () {},
        isButton: true,
      ),
    ];
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: desktopHeaderItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MaterialButton(
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80)),
                      hoverColor: kPrimaryColor,
                      onPressed: item.onTap,
                      child: Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ).px(8),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        // We will make this in a bit
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                //   Globals.scaffoldKey.currentState.openEndDrawer();
              },
              child: Icon(
                FlutterIcons.menu_fea,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          HeaderRow(),
        ],
      ),
    );
  }
}
