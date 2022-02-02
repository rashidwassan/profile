import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rashidwassan/models/header_item.dart';
import 'package:rashidwassan/pages/home/components/cv_section.dart';
import 'package:rashidwassan/pages/home/components/dialogs.dart';
import 'package:rashidwassan/pages/home/home.dart';
import 'package:rashidwassan/pages/testimonials_page.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:rashidwassan/utils/screen_helper.dart';
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: TextStyle(
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
      HeaderItem(
          title: "MY CODE",
          onTap: () {
            launchURL('https://github.com/rashidwassan');
          }),
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
            launchURL('https://medium.com/@rashidwassan');
          }),
      HeaderItem(
        title: "HIRE ME",
        onTap: () {
          showGetStartedDialog(context);
        },
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
                      child: TextButton(
                        style: ButtonStyle(
                          // padding: MaterialStateProperty.all(
                          //     const EdgeInsets.symmetric(
                          //         horizontal: 16, vertical: 16)),
                          elevation: MaterialStateProperty.all(12),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          backgroundColor:
                              MaterialStateProperty.all(kDangerColor),
                          shadowColor: MaterialStateProperty.all(kDangerColor),
                        ),
                        onPressed: item.onTap,
                        child: SizedBox(
                          height: 38,
                          width: 85,
                          child: Center(
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
          padding: EdgeInsets.symmetric(vertical: 0.0),
          child: BuildHeader(),
        ),
        // We will make this in a bit
        mobile: MobileHeader(),
        tablet: BuildHeader(),
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

// mobile header
class MobileHeader extends StatelessWidget {
  const MobileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderLogo(),
          // Restart server to make icons work
          // Lets make a scaffold key and create a drawer
          SizedBox(
            height: 50,
            width: 50,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(500)),
                padding: EdgeInsets.all(0),
                onPressed: () {
                  // Lets open drawer using global key
                  Scaffold.of(context).openEndDrawer();
                },
                child: Icon(
                  CupertinoIcons.rectangle_grid_2x2_fill,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
