import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFFF10D3);
const Color kBackgroundColor = Color(0xFF22272E);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);
const Color kheaderColor = Color(0xFF761AC8);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

class Images {
  Images._();
  static const splashAnimation = 'assets/anim/splash_anim.json';

  // avatars
  static const avatarAdult = 'assets/icons/adult.png';
  static const beard = 'assets/icons/beared.png';
  static const avatarBoy = 'assets/icons/boy.png';
  static const avatarGirl = 'assets/icons/girl.png';
  static const avatarGirlGlasses = 'assets/icons/girl_glasses.png';

  //icons
  static const pkIcon = 'assets/icons/pk.jpeg';
}
