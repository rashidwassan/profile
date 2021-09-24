import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rashidwassan/pages/home/components/blur_container.dart';
import 'package:rashidwassan/pages/home/components/carousel.dart';
import 'package:rashidwassan/pages/home/components/cv_section.dart';
import 'package:rashidwassan/pages/home/components/dialogs.dart';
import 'package:rashidwassan/pages/home/components/education_section.dart';
import 'package:rashidwassan/pages/home/components/footer.dart';
import 'package:rashidwassan/pages/home/components/header.dart';
import 'package:rashidwassan/pages/home/components/ios_app_ad.dart';
import 'package:rashidwassan/pages/home/components/portfolio_stats.dart';
import 'package:rashidwassan/pages/home/components/skill_section.dart';
import 'package:rashidwassan/pages/home/components/social_button_row.dart';
import 'package:rashidwassan/pages/home/components/sponsors.dart';
import 'package:rashidwassan/pages/home/components/testimonial_widget.dart';
import 'package:rashidwassan/pages/home/components/website_ad.dart';
import 'package:rashidwassan/pages/testimonials_page.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:rashidwassan/utils/globals.dart';
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
      endDrawer: _buildEndDrawer(context),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/mainback.png',
                  ),
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                  fit: BoxFit.cover),
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
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(16)),
              child: Header())
        ],
      ),
    );
  }

  Drawer _buildEndDrawer(BuildContext context) {
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
        SocialIconButtonsRow(),
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
