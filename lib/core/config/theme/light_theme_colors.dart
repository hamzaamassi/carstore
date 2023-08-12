import 'package:flutter/material.dart';

class LightThemeColors {
  //dark swatch
  static const Color primaryColor = Color(0xff1DB854);
  // 1DB854
  static const Color accentColor = Color(0xFFF3F3F5);

  //APPBAR
  static const Color appBarColor = Colors.white;

  //SCAFFOLD
  static const Color scaffoldBackgroundColor = Color(0xffF1F2F3);
  static const Color backgroundColor = Colors.white;
  static const Color dividerColor = Color(0xff8E8E93);
  static const Color cardColor = Colors.white;
  static const Color borderColor = Color(0xff707070);

  static const animationDuration = Duration(milliseconds: 400);

  static Color shimmerHighlighted = Colors.grey.shade200;
  static Color shimmerBase = Colors.grey.shade50;
  static const Color white_247 = Color.fromRGBO(247, 246, 250, 1);
  static const Color lightGrey = Color.fromRGBO(239, 239, 239, 1);
  static const Color lightColor = Color(0xFFAAB6C3);
  static const Color darkColor = Color(0xFF5E5F5F);
  static const Color agentColor = Color(0xFFD1D1D6);

  static const List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Color(0x29000000),
      blurRadius: 6,
      offset: Offset(0, 3),
    ),
  ];
  static const List<BoxShadow> boxShadowBtn = [
    BoxShadow(
      color: Color(0x8000000),
      blurRadius: 6,
      offset: Offset(0, 3),
    ),
  ];
  static const List<BoxShadow> boxShadow0 = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 6,
      offset: Offset(0, 0),
    ),
  ];
  //ICONS
  static const Color appBarIconsColor = Color(0xff8E8E93);
  static const Color iconColor = Colors.black;

  //BUTTON
  static const Color buttonColor = primaryColor;
  static const Color buttonTextColor = Colors.white;
  static const Color buttonDisabledColor = Colors.grey;
  static const Color buttonDisabledTextColor = Colors.black;

  //TEXT
  static const Color bodyTextColor = Color(0xff303030);
  static const Color secondaryBodyTextColor = Color(0xB35A6B82);
  static const Color headlinesTextColor = primaryColor;
  static const Color captionTextColor = Colors.grey;
  static const Color hintTextColor = Color(0xff686868);

  //text field
  static const Color textFieldColor = Colors.white;

  //chip
  static const Color chipBackground = primaryColor;
  static const Color chipTextColor = Colors.white;

  static const Color facebookColor = Color(0xff4267B2);

  // progress bar indicator
  static const Color progressIndicatorColor = primaryColor;
}
