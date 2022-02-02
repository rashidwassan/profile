import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rashidwassan/pages/home/components/cv_section.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:rashidwassan/models/testimonial.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:rashidwassan/utils/screen_helper.dart';
import 'package:rashidwassan/utils/testimonials.dart';

import 'home/components/social_button_row.dart';

class TestimonialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUi(double width) {
  return Material(
    color: Colors.transparent,
    child: Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "TESTIMONIALS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "This is section contains some testimonials from worthy people I have worked with. If you want to write one, consider visting my ",
                            style: TextStyle(
                              color: Colors.white,
                              height: 1.8,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                              text: "LinkedIn profile",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  height: 1.8,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchURL(
                                      'https://linkedin.com/in/rashidwassan');
                                }),
                          TextSpan(
                            text: ".",
                            style: TextStyle(
                                color: Colors.white, height: 1.8, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Flex(
                    direction: Axis.vertical,
                    // Lets map
                    children: allTestimonials.map((testimonial) {
                      return Expanded(
                        flex: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(bottom: 32.0),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 0.3, color: Colors.white)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    child: Icon(
                                  FontAwesomeIcons.quoteLeft,
                                  color: kPrimaryColor,
                                  size: 40,
                                )),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Text(
                                  testimonial.text,
                                  style: TextStyle(
                                    color: kCaptionColor,
                                    height: 1.8,
                                  ),
                                ),
                                SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SocialButtonWithShadow(
                                        icon: FontAwesome.user,
                                        color: kPrimaryColor),
                                    SizedBox(
                                      width: 24.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          testimonial.personName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.0,
                                        ),
                                        Text(
                                          testimonial.occupation,
                                          style: TextStyle(
                                            color: kCaptionColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
