import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:web_portfolio/models/testimonial.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'package:web_portfolio/utils/testimonials.dart';

class TestimonialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    style: GoogleFonts.oswald(
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
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 0.3, color: Colors.white)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/quote.png",
                                    width: 40.0,
                                  ),
                                ),
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
                                  height: 15.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage(
                                        testimonial.profilePhoto,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          testimonial.personName,
                                          style: GoogleFonts.oswald(
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
