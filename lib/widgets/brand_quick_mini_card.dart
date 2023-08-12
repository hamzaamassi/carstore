import 'package:e_commerce_car/app/brand/model/brand.dart';
import 'package:e_commerce_car/app/cars/model/car.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BrandQuickMiniCard extends StatelessWidget {
  const BrandQuickMiniCard({Key? key, required this.brand}) : super(key: key);

  // final Car car;
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
      Get.toNamed(Routes.brandDetails),
      //, arguments: BrandDetails(brand: brand)
      child: Container(
        width: 102.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: LightThemeColors.cardColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
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
}
