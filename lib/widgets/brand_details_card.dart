import 'package:carstore/app/brand/controller/brand_controller.dart';
import 'package:carstore/app/brand/model/brand.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrandPageCard extends GetView<BrandController> {
  const BrandPageCard({Key? key, required this.brand}) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>navigateToBrandDetailsPage(),
      child: Container(
        width: 75.w,
        height: 75.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: LightThemeColors.scaffoldBackgroundColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 14.h,
              right: 13.w,
              left: 13.w,
              child: Image.network(
                brand.logo,
                height: 30.h,
                width: 30.w,
              ),
            ),
            Positioned(
              bottom: 10.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    brand.name,
                    style: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        color: LightThemeColors.appBarIconsColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToBrandDetailsPage() {
    controller.brandName.value = brand.name;
    controller.brandId.value = brand.id;
    controller.loadBrandCars();
  }
}
