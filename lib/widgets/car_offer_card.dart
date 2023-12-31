import 'package:carstore/app/cars/controllers/car_controller.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/app/cars/model/car.dart';
import 'package:carstore/core/config/translations/strings_enum.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CarsOfferCard extends GetView<CarController> {
  const CarsOfferCard({Key? key, required this.car}) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToCarDetailsPage,
      child: Container(
        width: 158,
        height: 225,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: LightThemeColors.cardColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 19,
              right: 15,
              left: 15,
              child: Image.network(
                car.image,
                width: 120.w,
                height: 80.h,
              ),
            ),
            Positioned(
              left: 15,
              top: 119,
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
                  Opacity(
                    opacity: .8,
                    child: Text(
                      car.name, //
                      style: TextStyle(fontSize: MyFonts.chipTextSize),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
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
              top: 0,
              left: 0,
              child: Container(
                height: 23,
                width: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: LightThemeColors.primaryColor.withOpacity(.5)),
                child: Text(
                  Strings.offers.tr,
                  style: const TextStyle(color: LightThemeColors.primaryColor),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                // onTap: () => car.favorite = !car.favorite!,
                child: car.stars == 3 //
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
