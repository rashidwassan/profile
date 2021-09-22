import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rashidwassan/utils/constants.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:rashidwassan/pages/home/components/cv_section.dart';

class SocialIconButtonsRow extends StatelessWidget {
  const SocialIconButtonsRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/socialbg.png'),
          fit: BoxFit.cover,
          //  colorFilter: ColorFilter.mode(Colors.white70, BlendMode.colorDodge),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.purple.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 24,
              offset: Offset(0, 12))
        ],
      ),
      padding: EdgeInsets.all(24),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 24,
        runSpacing: 24,
        // mainAxisAlignment:
        //     (isMobile) ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
        children: [
          SocialButtonWithShadow(
            icon: FontAwesomeIcons.facebookF,
            color: const Color(0xFF4267B2),
            onPressed: () {
              launchURL('https://www.facebook.com/rashidwassann');
            },
          ),
          SocialButtonWithShadow(
            icon: FontAwesomeIcons.github,
            color: const Color(0xFF2D333B),
            onPressed: () {
              launchURL('https://github.com/RashidWassan');
            },
          ),
          SocialButtonWithShadow(
            icon: FontAwesomeIcons.linkedinIn,
            color: const Color(0xFF2867B2),
            onPressed: () {
              launchURL('https://www.linkedin.com/in/rashidwassan/');
            },
          ),
          SocialButtonWithShadow(
            icon: FontAwesomeIcons.youtube,
            color: const Color(0xFFDB4437),
            onPressed: () {
              launchURL('https://www.youtube.com/c/RashidsTechStuff');
            },
          ),
          SocialButtonWithShadow(
            icon: FontAwesomeIcons.twitter,
            color: const Color(0xFF1DA1F2),
            onPressed: () {
              launchURL('https://twitter.com/RashidWassaan');
            },
          ),
          SocialButtonWithShadow(
            icon: FontAwesomeIcons.mediumM,
            color: const Color(0xFF202122),
            onPressed: () {
              launchURL('https://rashidwassan.medium.com/');
            },
          ),
          SocialButtonWithShadow(
            icon: FontAwesomeIcons.instagram,
            color: const Color(0xFFC13584),
            onPressed: () {
              launchURL('https://www.instagram.com/rashidwassaan/');
            },
          ),
          SocialButtonWithShadow(
            icon: FontAwesomeIcons.discord,
            color: const Color(0xFF5865F2),
            onPressed: () {
              launchURL('https://discordapp.com/users/rashidwassan/');
            },
          ),
        ],
      ),
    );
  }
}

class SocialButtonWithShadow extends StatelessWidget {
  const SocialButtonWithShadow(
      {Key key, @required this.icon, @required this.color, this.onPressed})
      : super(key: key);

  final Color color;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 47,
      height: 47,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          elevation: MaterialStateProperty.all(12),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          backgroundColor: MaterialStateProperty.all(color),
          shadowColor: MaterialStateProperty.all(color),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
