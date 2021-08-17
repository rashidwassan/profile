import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:web_portfolio/pages/home/components/carousel.dart';
import 'package:web_portfolio/pages/home/components/cv_section.dart';
import 'package:web_portfolio/pages/home/components/dialogs.dart';
import 'package:web_portfolio/pages/home/components/education_section.dart';
import 'package:web_portfolio/pages/home/components/footer.dart';
import 'package:web_portfolio/pages/home/components/header.dart';
import 'package:web_portfolio/pages/home/components/ios_app_ad.dart';
import 'package:web_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:web_portfolio/pages/home/components/skill_section.dart';
import 'package:web_portfolio/pages/home/components/sponsors.dart';
import 'package:web_portfolio/pages/home/components/testimonial_widget.dart';
import 'package:web_portfolio/pages/home/components/website_ad.dart';
import 'package:web_portfolio/pages/testimonials_page.dart';
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
      endDrawer: _buildEndDrawer(context),
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

  Drawer _buildEndDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            color: kBackgroundColor,
            image: DecorationImage(
                image: AssetImage(
                  'assets/drawerbg.png',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    kBackgroundColor.withOpacity(0.5), BlendMode.darken))),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: Image.asset('assets/rashid.png').p(32)),
              Divider(
                color: Colors.white60,
                height: 4,
              ),
              Expanded(
                  flex: 2,
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
                              launchURL('https://medium.com/@rashidwassaan');
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
              Divider(
                color: Colors.white60,
                height: 4,
              ),
              'Made with Flutter with ❤️.'.text.white.makeCentered().py(8),
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
    return MaterialButton(
      elevation: 0,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: color,
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
        //   TestimonialWidget(),
      ],
    );
  }
}
