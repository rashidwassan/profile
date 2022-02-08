import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rashidwassan/pages/home/components/cv_section.dart';
import 'package:rashidwassan/pages/home/components/dialogs.dart';
import 'package:rashidwassan/pages/home/home.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../testimonials_page.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kBackgroundColor,
          // gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //       kheaderColor,
          //       Colors.teal,
          //       Colors.black87,
          //       kPrimaryColor,
          //       kheaderColor
          //     ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: 2, child: Image.asset(Images.imageOutOfSpace).p(24)),
            Divider(
              color: kPrimaryColor,
              thickness: 0.3,
              height: 1,
            ).px(24),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      16.heightBox,
                      EndDrawerButton(
                          title: 'HOME',
                          icon: CupertinoIcons.home,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }),
                      EndDrawerButton(
                              title: 'MY INTRO',
                              icon: MaterialIcons.info,
                              onPressed: () {})
                          .py(16),
                      EndDrawerButton(
                          title: 'MY CODE',
                          icon: MaterialIcons.code,
                          onPressed: () {
                            launchURL('https://github.com/rashidwassan');
                          }),
                      EndDrawerButton(
                          title: 'TESTIMONIALS',
                          icon: CupertinoIcons.book,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(child: TestimonialsPage())));
                          }).py(16),
                      EndDrawerButton(
                          title: 'ARTICLES',
                          icon: MaterialIcons.book,
                          onPressed: () {
                            launchURL('https://medium.com/@rashidwassan');
                          }),
                      16.heightBox,
                      EndDrawerButton(
                          title: 'HIRE ME',
                          color: kheaderColor,
                          icon: MaterialIcons.add,
                          onPressed: () {
                            showGetStartedDialog(context);
                          }).py(16),
                    ],
                  ),
                )),
            24.heightBox,
            'Made with Flutter with ❤️'.text.white.makeCentered().py(8),
          ],
        ),
      ),
    );
  }
}

class EndDrawerButton extends StatelessWidget {
  const EndDrawerButton(
      {Key key,
      @required this.title,
      @required this.icon,
      this.color = Colors.transparent,
      @required this.onPressed})
      : super(key: key);

  final String title;
  final IconData icon;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((states) => kPrimaryColor),
        padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
        backgroundColor: MaterialStateProperty.all(color),
        shadowColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(12),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white60,
            size: 25,
          ),
          16.widthBox,
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    ).px(24);
  }
}
