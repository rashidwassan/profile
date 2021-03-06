import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:rashidwassan/pages/home/components/social_button_row.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rashidwassan/pages/testimonials_page.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:rashidwassan/utils/screen_helper.dart';
import 'package:rashidwassan/utils/testimonials.dart';

import '../home.dart';

class TestimonialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: BuildTestimonialUI(width: kDesktopMaxWidth),
        tablet: BuildTestimonialUI(width: kTabletMaxWidth),
        mobile: BuildTestimonialUI(width: getMobileMaxWidth(context)),
      ),
    );
  }
}

class BuildTestimonialUI extends StatelessWidget {
  const BuildTestimonialUI({Key key, @required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  constraints: BoxConstraints(maxWidth: 400.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "This is section contains some testimonials from worthy people I have worked with.",
                          style: TextStyle(color: Colors.white, height: 1.8),
                        ),
                        TextSpan(
                            text: " click here to read more!",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Home(child: TestimonialsPage())));
                              },
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              height: 1.8,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.0,
                ),
                Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  // Lets map
                  children: highlightedTestimonials.map((testimonial) {
                    return Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Icon(
                                FontAwesome.quote_left,
                                color: kPrimaryColor,
                                size: 50.0,
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              testimonial.text,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kCaptionColor,
                                height: 1.8,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  testimonial.profilePhoto,
                                  height: 65,
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
