import 'package:carstore/app/brand/controller/brand_controller.dart';
import 'package:carstore/app/brand/model/brand.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrandMiniCard extends GetView<BrandController> {
  const BrandMiniCard({Key? key, required this.brand}) : super(key: key);
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToBrandPage(),
      child: Container(
        width: 102.w,
        height: 102.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: LightThemeColors.cardColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 11.h,
              right: 11.w,
              left: 11.w,
              child: Image.network(
                brand.logo,
                height: 60.h,
                width: 80.w,
              ),
            ),
            Positioned(
              left: 0.w,
              right: 0.w,
              bottom: 13.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    brand.name,
                    style: TextStyle(
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
