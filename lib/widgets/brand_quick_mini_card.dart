import 'package:carstore/app/brand/controller/brand_controller.dart';
import 'package:carstore/app/brand/model/brand.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BrandQuickMiniCard extends GetView<BrandController> {
  const BrandQuickMiniCard({Key? key, required this.brand}) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>navigateToBrandPage(),
      child: Container(
        height: 30.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: LightThemeColors.cardColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              brand.logo,
              height: 22.h,
              width: 22.w,
            ),
            SizedBox(width:4.w ),
            Text(
              brand.name,
              style: TextStyle(
                fontSize: MyFonts.headline6TextSize,
                color: LightThemeColors.iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
  navigateToBrandPage() {
    controller.brandId.value = brand.id;
    controller.loadBrandCars();
  }
}
