import 'package:carstore_car/app/cars/controllers/car_controller.dart';
import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CarSimilarCard extends GetView<CarController> {
  const CarSimilarCard({super.key, required this.car, this.color});

  final Car car;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToCarDetailsPage(),
      child: Container(
        width: 150.w,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color??LightThemeColors.backgroundColor,
        ),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PositionedDirectional(
              top: 12.h,
              end: 12.w,
              child: GestureDetector(
                // onTap: () => car.favorite = !car.favorite!,
                child: car.stars == 3//
                    ? SvgPicture.asset(AppIcons.selectedfavorite,
                        width: 14.w, height: 14.h)
                    : SvgPicture.asset(AppIcons.favorite,
                        width: 14.w, height: 14.h),
              ),
            ),
            PositionedDirectional(
                top: 15.h,
                start: 0.w,
                end: 0.w,
                child: Image.network(
                  car.image,
                  height: 80.h,
                  width: 120,
                  fit: BoxFit.contain,
                )),
            PositionedDirectional(
              start: 15.w,
              bottom: 26.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                    style: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        fontWeight: FontWeight.bold,
                        color: LightThemeColors.iconColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text('\$${car.price}',
                      style: TextStyle(
                          fontSize: MyFonts.headline6TextSize,
                          color: LightThemeColors.primaryColor)),
                ],
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
