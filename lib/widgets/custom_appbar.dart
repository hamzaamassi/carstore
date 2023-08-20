// ignore_for_file: deprecated_member_use

import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar getAppBar(
  BuildContext context, {
  String title = "",
  bool showBackIcon = false,
  List<Widget> actions = const [],
  VoidCallback? onBack,
  VoidCallback? action,
  String? leadingIcon,
  String? text,
}) {
  return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title,style: TextStyle(fontSize: MyFonts.body2TextSize,color: LightThemeColors.appBarIconsColor),),
      actions: actions,
      elevation: 0,
      centerTitle: true,
      leading: showBackIcon
          ? GestureDetector(
              onTap: () => onBack ?? Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                    width: 13.w,
                    height: 13.h,
                    leadingIcon ?? AppIcons.backtrackIcon,
                    color: LightThemeColors.dividerColor),
              ),
            )
          : null);
}
