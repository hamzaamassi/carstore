import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/translations/localization_service.dart';
import 'package:carstore/local/my_shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyFonts {
  // return the right font depending on app language
  static TextStyle get getAppFontType =>
      LocalizationService.supportedLanguagesFontsFamilies[
          MySharedPref.getCurrentLocal().languageCode]!;

  // headlines text font
  static TextStyle get headlineTextStyle => getAppFontType;

  // body text font
  static TextStyle get bodyTextStyle => getAppFontType;

  // button text font
  static TextStyle get buttonTextStyle => getAppFontType;

  // app bar text font
  static TextStyle get appBarTextStyle => getAppFontType;

  // chips text font
  static TextStyle get chipTextStyle => getAppFontType;

  // appbar font size
  static double get appBarTittleSize => 18.sp;

  // body font size
  static double get body1TextSize => 16.sp;

  static double get body2TextSize => 14.sp;

  // headlines font size
  static double get headline1TextSize => 50.sp;

  static double get headline2TextSize => 40.sp;

  static double get headline3TextSize => 30.sp;

  static double get headline4TextSize => 25.sp;

  static double get headline5TextSize => 22.sp;

  static double get sectionListTitle => 20.sp;

  static double get headline6TextSize => 12.sp;

  //button font size
  static double get buttonTextSize => 15.sp;

  //caption font size
  static double get captionTextSize => 13.sp;

  //chip font size
  static double get chipTextSize => 10.sp;
  static double get smallTextSize => 8.sp;
}

extension CustomTextStyle on TextStyle {
  TextStyle get primaryColor => copyWith(color: LightThemeColors.primaryColor);

  TextStyle get blackColor => copyWith(color: LightThemeColors.bodyTextColor);

  TextStyle get redColor => copyWith(color: Colors.red);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle withSize(double size) => copyWith(fontSize: size);
}
