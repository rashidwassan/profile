import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rashidwassan/models/footer_item.dart';
import 'package:rashidwassan/pages/home/components/social_button_row.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:rashidwassan/utils/screen_helper.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconData: FontAwesome.address_card,
    title: "ADDRESS",
    text1: "Room #72, Latif Hostel",
    text2: "MUET Jamshoro, Pakistan",
  ),
  FooterItem(
    iconData: FontAwesome.phone,
    title: "PHONE",
    text1: "+923078611011",
    text2: "+923133590980",
  ),
  FooterItem(
    iconData: FontAwesome.envelope,
    title: "EMAIL",
    text1: "rashidwassaan@gmail.com",
    text2: "Not Available",
  ),
  FooterItem(
    iconData: FontAwesome.whatsapp,
    title: "WHATSAPP",
    text1: "+923078611011",
    text2: "+923133590980",
  )
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: FooterUI(width: kDesktopMaxWidth),
        tablet: FooterUI(width: kTabletMaxWidth),
        mobile: FooterUI(width: getMobileMaxWidth(context)),
      ),
    );
  }
}

class FooterUI extends StatelessWidget {
  const FooterUI({Key key, @required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Wrap(
                    spacing: 24.0,
                    runSpacing: 24.0,
                    children: footerItems
                        .map(
                          (footerItem) => Container(
                            height: 120.0,
                            width: ScreenHelper.isMobile(context)
                                ? constraints.maxWidth / 2.0 - 20.0
                                : constraints.maxWidth / 4.0 - 20.0,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        footerItem.iconData,
                                        color: kPrimaryColor,
                                        size: 25.0,
                                      ),
                                      SizedBox(
                                        width: 16.0,
                                      ),
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.oswald(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Expanded(
                                    child: RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "${footerItem.text1}\n",
                                            style: TextStyle(
                                              color: kCaptionColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${footerItem.text2}\n",
                                            style: TextStyle(
                                              color: kCaptionColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  mainAxisAlignment: ScreenHelper.isMobile(context)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Copyright (c) 2021 Rashid Wassan. All rights Reserved",
                        style: TextStyle(
                          color: kCaptionColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                color: kCaptionColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "|",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                color: kCaptionColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
