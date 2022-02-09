import 'package:flutter/material.dart';
import 'package:rashidwassan/pages/home/components/carousel.dart';
import 'package:rashidwassan/pages/home/components/cv_section.dart';
import 'package:rashidwassan/pages/home/components/education_section.dart';
import 'package:rashidwassan/pages/home/components/footer.dart';
import 'package:rashidwassan/pages/home/components/header.dart';
import 'package:rashidwassan/pages/home/components/ios_app_ad.dart';
import 'package:rashidwassan/pages/home/components/mobile_drawer.dart';
import 'package:rashidwassan/pages/home/components/portfolio_stats.dart';
import 'package:rashidwassan/pages/home/components/skill_section.dart';
import 'package:rashidwassan/pages/home/components/social_button_row.dart';
import 'package:rashidwassan/pages/home/components/testimonial_widget.dart';
import 'package:rashidwassan/pages/home/components/website_ad.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  Home({this.child});
  final Widget child;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: EndDrawer(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                      kBackgroundColor,
                      kheaderColor.withOpacity(0.5)
                    ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.decal)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    60.heightBox,
                    (widget.child == null) ? HomeWidget() : widget.child,
                    Footer(),
                    24.heightBox
                  ],
                ),
              ),
            ),
            Header()
          ],
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Carousel(),
        SizedBox(
          height: 24.0,
        ),
        CvSection(),
        IosAppAd(),
        SizedBox(
          height: 70.0,
        ),
        WebsiteAd(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0),
          child: PortfolioStats(),
        ),
        SizedBox(
          height: 50.0,
        ),
        Center(
          child: Text(
            'CATCH ME ON',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        SocialIconButtonsRow().px(24),
        SizedBox(
          height: 50,
        ),
        EducationSection(),
        SizedBox(
          height: 50.0,
        ),
        SkillSection(),
        SizedBox(
          height: 50.0,
        ),
        SizedBox(
          height: 50.0,
        ),
        TestimonialWidget(),
      ],
    );
  }
}
