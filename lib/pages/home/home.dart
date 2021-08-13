import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/ios_app_ad.dart';
import 'package:web_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/sponsors.dart';
import 'package:web_portfolio/pages/home/components/testimonial_widget.dart';
import 'package:web_portfolio/pages/home/components/website_ad.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/globals.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  Home({this.child});
  Widget child;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              // drawer for mobile to be designed
              child: SizedBox()),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Header(),
              ),
              (widget.child == null) ? _buildHomeWidgets() : widget.child,
              Footer(),
              24.heightBox
            ],
          ),
        ),
      ),
    );
  }

  Column _buildHomeWidgets() {
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
        EducationSection(),
        SizedBox(
          height: 50.0,
        ),
        SkillSection(),
        SizedBox(
          height: 50.0,
        ),
        Sponsors(),
        SizedBox(
          height: 50.0,
        ),
        TestimonialWidget(),
      ],
    );
  }
}
