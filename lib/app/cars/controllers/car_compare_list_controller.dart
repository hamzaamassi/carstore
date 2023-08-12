import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarCompareListController extends GetxController {

  final count = 0.obs;

  void increment() => count.value++;

  Widget bulidItem(context, index) => Row(
    children: [
      Container(
        width: 100.w,
        height: 100.w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppIcons.carPic)),
          borderRadius: BorderRadius.circular(10.r),
          color: LightThemeColors.scaffoldBackgroundColor,
        ),
      ),
      SizedBox(width: 22.w),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Porsche 718",
            style: TextStyle(
              fontSize: MyFonts.sectionListTitle,
              fontWeight: FontWeight.bold,
              color: LightThemeColors.iconColor,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Porsche/Luxury/The 2.3L EcoBoost",
            style: TextStyle(
                fontSize: MyFonts.chipTextSize,
                color: LightThemeColors.dividerColor),
          ),
          SizedBox(height: 13.h),
          Text(
            "\$62,000.00-\$74,000.00",
            style: TextStyle(
              fontSize: MyFonts.body2TextSize,
              color: LightThemeColors.primaryColor,
            ),
          ),
        ],
      ),
    ],
  );
}
