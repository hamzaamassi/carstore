import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarSearchCard extends StatelessWidget {
  const CarSearchCard({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: LightThemeColors.backgroundColor),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 9.w),
                Text('${car.id}. '),
                SizedBox(width: 9.w),
                Image.asset(car.image),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(car.name),
                    SizedBox(height: 5.h),
                    Opacity(
                      opacity: .6,
                      child: Text(
                        car.name,//
                        style: TextStyle(fontSize: MyFonts.chipTextSize),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${car.price}',
                  style: const TextStyle(color: LightThemeColors.primaryColor),
                ),
                SizedBox(height: 5.h),
                Opacity(
                  opacity: .6,
                  child: Text(
                    'Sell',
                    style: TextStyle(fontSize: MyFonts.chipTextSize),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
