import 'package:carstore/app/cars/controllers/car_controller.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/app/cars/model/car.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CarsMiniUpcomingCard extends GetView<CarController> {
  const CarsMiniUpcomingCard({Key? key, required this.car}) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>navigateToCarDetailsPage()
          ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: LightThemeColors.cardColor,
        ),
        width: 150.w,
        height: 200.h,
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
                    car.name,
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
              bottom: 13,
              left: 15.w,
              child: Opacity(
                  opacity: .8,
                  child: Text(
                    '${car.ratingsCount}',//
                    style: TextStyle(
                      fontSize: MyFonts.chipTextSize,
                    ),
                  )),
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: GestureDetector(
                // onTap: () => car.favorite = !car.favorite!,
                child: car.stars == 3
                    ? SvgPicture.asset(AppIcons.selectedfavorite,
                    width: 14.w, height: 14.h)
                    : SvgPicture.asset(AppIcons.favorite,
                    width: 14.w, height: 14.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void navigateToCarDetailsPage() {
    controller.loadCarDetails(car.id);
  }
}
