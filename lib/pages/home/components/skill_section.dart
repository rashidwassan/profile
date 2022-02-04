import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '/models/skill.dart';
import '/utils/constants.dart';
import '/utils/screen_helper.dart';

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 85,
  ),
  Skill(
    skill: "Python",
    percentage: 77,
  ),
  Skill(
    skill: "Javascript",
    percentage: 60,
  ),
  Skill(
    skill: "Java",
    percentage: 78,
  ),
  Skill(
    skill: "C++",
    percentage: 80,
  ),
];

class SkillSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: BuildSkillsUI(width: kDesktopMaxWidth),
        tablet: BuildSkillsUI(width: kTabletMaxWidth),
        mobile: BuildSkillsUI(width: getMobileMaxWidth(context)),
      ),
    );
  }
}

class BuildSkillsUI extends StatelessWidget {
  const BuildSkillsUI({Key key, @required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    print('skills build');
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: LottieBuilder.asset(
                    Images.skillAnim,
                    frameRate: FrameRate(60),
                  ),
                ),
                if (ScreenHelper.isMobile(context))
                  SizedBox(
                    height: 32,
                  ),
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SKILLS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "This is all the skills listed below more will be added in due time.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      SkillsList()
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SkillsList extends StatelessWidget {
  const SkillsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: skills.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Flexible(
                  flex: skills[index].percentage.toInt(),
                  child: Container(
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [kheaderColor, kPrimaryColor]),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 8,
                          )
                        ]),
                    alignment: Alignment.centerLeft,
                    child:
                        skills[index].skill.text.semiBold.white.make().px(16),
                  ),
                ),
                12.widthBox,
                Flexible(
                  flex: (100 - skills[index].percentage).toInt(),
                  child: Container(
                    height: 0.5,
                    color: kPrimaryColor.withOpacity(0.5),
                  ),
                ),
                8.widthBox,
                '${skills[index].percentage.toInt()}%'.text.sm.white.make(),
              ],
            ),
          );
        });
  }
}
