import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchProductController extends GetxController {
  Widget buildHistory(context, index,List list) {
    return Container(
      width: 103.w,
      height: 34.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: LightThemeColors.backgroundColor),
      child: Text(list[index]),
    );
  }
}
