import 'package:e_commerce_car/app/cars/controllers/car_compare_controller.dart';
import 'package:e_commerce_car/app/cars/model/car.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarCompareCard extends GetView<CarsCompareController> {
  const CarCompareCard({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    var value = controller.isChecked;

    return Container(
      height: 200.h,
      width: 160.w,
      decoration: BoxDecoration(
        color: LightThemeColors.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 15.w,
          end: 15.w,
          top: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              car.image,
              height: 90.h,
              width: 120.w,
              fit: BoxFit.contain,
            )),
            Text(
              car.name,
              style: TextStyle(
                fontSize: MyFonts.body2TextSize,
                color: LightThemeColors.iconColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              '${car.price}',
              style: TextStyle(
                color: LightThemeColors.primaryColor,
                fontSize: MyFonts.headline6TextSize,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                (bool? value) {
                  controller.changeValueOfCheckBox(value!);
                };
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 12.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: value
                          ? LightThemeColors.primaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: value
                            ? LightThemeColors.primaryColor
                            : LightThemeColors.dividerColor,
                        width: 1.25,
                      ),
                    ),
                    child: value
                        ? const Icon(
                            Icons.check,
                            size: 10.0,
                            color: LightThemeColors.backgroundColor,
                          )
                        : const Icon(
                            Icons.check_box_outline_blank_rounded,
                            size: 18.0,
                            color: Colors.transparent,
                          ),
                  ), SizedBox(width: 6.w),
                  Text(
                    'Compare',
                    style: TextStyle(
                      color: LightThemeColors.dividerColor,
                      fontSize: MyFonts.body2TextSize,
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
}
