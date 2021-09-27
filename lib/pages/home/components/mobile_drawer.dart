import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rashidwassan/pages/home/components/cv_section.dart';
import 'package:rashidwassan/pages/home/components/dialogs.dart';
import 'package:rashidwassan/pages/home/home.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../testimonials_page.dart';

Drawer buildEndDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
          color: kBackgroundColor,
          image: DecorationImage(
              image: AssetImage(
                'assets/mainbg.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  kBackgroundColor.withOpacity(0.5), BlendMode.darken))),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: 2, child: Image.asset('assets/rashid2.png').p(32)),
            Divider(
              color: Colors.white60,
              height: 4,
            ).px(24),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      16.heightBox,
                      _buildEndDrawerButton(
                          title: 'HOME',
                          icon: CupertinoIcons.home,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }),
                      _buildEndDrawerButton(
                              title: 'MY INTRO',
                              icon: MaterialIcons.info,
                              onPressed: () {})
                          .py(16),
                      _buildEndDrawerButton(
                          title: 'MY CODE',
                          icon: MaterialIcons.code,
                          onPressed: () {
                            launchURL('https://github.com/rashidwassan');
                          }),
                      _buildEndDrawerButton(
                          title: 'TESTIMONIALS',
                          icon: CupertinoIcons.book,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(child: TestimonialsPage())));
                          }).py(16),
                      _buildEndDrawerButton(
                          title: 'ARTICLES',
                          icon: MaterialIcons.book,
                          onPressed: () {
                            launchURL('https://medium.com/@rashidwassan');
                          }),
                      16.heightBox,
                      _buildEndDrawerButton(
                          title: 'HIRE ME',
                          color: kDangerColor,
                          icon: MaterialIcons.add,
                          onPressed: () {
                            showGetStartedDialog(context);
                          }).py(16),
                    ],
                  ),
                )),
            24.heightBox,
            // Divider(
            //   color: Colors.white60,
            //   height: 4,
            // ),
            'Made with Flutter with ❤️'.text.white.makeCentered().py(8),
          ],
        ),
      ),
    ),
  );
}

Widget _buildEndDrawerButton(
    {String title,
    IconData icon,
    Color color = Colors.transparent,
    Function() onPressed}) {
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
          color: Colors.white,
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