import 'package:flutter/material.dart';
import 'package:neon/neon.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '/models/design_process.dart';
import '/utils/constants.dart';
import '/utils/screen_helper.dart';

const _cVUrl =
    'https://drive.google.com/file/d/1l6YViAYRUukuVNsn633YK5DqsxbFyF9g/view?usp=sharing';

void launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch url';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "DESIGN",
    imagePath: "assets/design.png",
    subtitle:
        "Having designed 15+ professional grade UIs with proper responsiveness & adaptness.",
  ),
  DesignProcess(
    title: "DEVELOP",
    imagePath: "assets/develop.png",
    subtitle:
        "Strong understanding of object oriented programming along with best practices for performance.",
  ),
  DesignProcess(
    title: "WRITE",
    imagePath: "assets/write.png",
    subtitle:
        "Experience of multiple well-written articles. Click articles button in upper right corner to learn more.",
  ),
  DesignProcess(
    title: "CREATIVITY",
    imagePath: "assets/promote.png",
    subtitle:
        "Good hands-on experience in generating design ideas according to client's needs and expectations.",
  ),
];

class CvSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: CVSectionUI(width: kDesktopMaxWidth),
        tablet: CVSectionUI(width: kTabletMaxWidth),
        mobile: CVSectionUI(width: getMobileMaxWidth(context)),
      ),
    );
  }
}

class CVSectionUI extends StatelessWidget {
  const CVSectionUI({Key key, @required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "BETTER DESIGN,\nBETTER EXPERIENCES",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0,
                  ),
                ),
              ),
              MaterialButton(
                splashColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () {
                  launchURL(_cVUrl);
                },
                child: Neon(
                  text: "DOWNLOAD CV",
                  color: Colors.pink,
                  font: NeonFont.Automania,
                  fontSize: 15,
                  glowing: true,
                  glowingDuration: Duration(milliseconds: 250),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            child: LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                            ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 2.0
                        : 250.0,
                    // Hack to adjust child height
                    childAspectRatio: ScreenHelper.isDesktop(context)
                        ? 1
                        : MediaQuery.of(context).size.aspectRatio * 1.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                designProcesses[index].imagePath,
                                width: 40.0,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Flexible(
                                child: Text(
                                  designProcesses[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            designProcesses[index].subtitle,
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: designProcesses.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
