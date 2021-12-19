import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rashidwassan/models/skill.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:rashidwassan/utils/screen_helper.dart';

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
    percentage: 70,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(320),
                    child: Image.asset(
                      "assets/skills.jpeg",
                      width: 300.0,
                    ),
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
                        style: GoogleFonts.oswald(
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
                        height: 15.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: skill.percentage,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10.0),
                                          alignment: Alignment.centerLeft,
                                          height: 30.0,
                                          child: Text(
                                            skill.skill,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(30),
                                                bottomRight:
                                                    Radius.circular(30),
                                                topLeft: Radius.circular(30),
                                                bottomLeft:
                                                    Radius.circular(30)),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(2, 3),
                                                  color: kPrimaryColor
                                                      .withOpacity(0.3),
                                                  blurRadius: 8,
                                                  spreadRadius: 0.1)
                                            ],
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        // remaining (blank part)
                                        flex: 100 - skill.percentage,
                                        child: Divider(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "${skill.percentage}%",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
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
