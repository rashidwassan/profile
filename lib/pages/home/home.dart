import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:rashidwassan/pages/home/components/sponsors.dart';
import 'package:rashidwassan/pages/home/components/testimonial_widget.dart';
import 'package:rashidwassan/pages/home/components/website_ad.dart';
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
    return Scaffold(
      endDrawer: buildEndDrawer(context),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/mainback.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    60.heightBox,
                    (widget.child == null) ? _buildHomeWidgets() : widget.child,
                    Footer(),
                    24.heightBox
                  ],
                ),
              ),
            ),
          ),
          // BlurContainer(
          //     child: Container(
          //   color: Colors.transparent,
          //   height: 60,
          //   width: double.infinity,
          //   child: Row(),
          // )),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Header())
        ],
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
        Center(
          child: Text(
            'CATCH ME ON',
            style: GoogleFonts.oswald(
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
        Sponsors(),
        SizedBox(
          height: 50.0,
        ),
        TestimonialWidget(),
      ],
    );
  }
}
