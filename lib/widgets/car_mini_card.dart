import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/routes/app_pages.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CarsMiniCard extends StatelessWidget {
  const CarsMiniCard({Key? key, required this.car}) : super(key: key);

  // final Car car;
  final Car car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
      Get.toNamed(Routes.carDetails),
      //, arguments: CarDetailsPage(car: car)
      child: Container(
        width: 150.w,
        height: 225.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: LightThemeColors.cardColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 15.h,
              right: 15.w,
              left: 15.w,
              child: Image.network(car.image,height: 80.h,width: 120.w),
            ),
            Positioned(
              left: 15.w,
              top: 119.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name ?? '',
                    style: TextStyle(
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '\$ ${car.price}',
                    style: TextStyle(
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8.h,
              left: 15.w,
              right: 15.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.home),
                    child: SvgPicture.asset(AppIcons.underRow),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: GestureDetector(
                // onTap: () => car.favorite = !car.favorite!,
                child: car.stars == 3//
                    ? SvgPicture.asset(
                       AppIcons.selectedfavorite,                 )
                    : SvgPicture.asset(
                    AppIcons.favorite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
