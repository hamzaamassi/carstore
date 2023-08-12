import 'package:e_commerce_car/app/brand/model/beand_car_response.dart';
import 'package:e_commerce_car/app/cars/model/car.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({Key? key, required this.brandCar}) : super(key: key);

  // final Car car;
  final BrandCar brandCar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.newsDetails),
      //,arguments: NewsDetailsPage(news: news),
      child: Container(
        width: 335.w,
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: LightThemeColors.cardColor,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Positioned(
                  top: 0.h,
                  bottom: 0.h,
                  left: 10.w,
                  child: Image.network(brandCar.image, height: 80.h, width: 120.w),
                ),
                SizedBox(width: 15.w),
                Positioned(
                  left: 10.w,
                  top: 10.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        brandCar.name,
                        style: TextStyle(
                          fontSize: MyFonts.body2TextSize,
                          color: LightThemeColors.iconColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Opacity(
                          opacity: .8,
                          child: Text(
                            brandCar.name,//
                            style: TextStyle(
                              fontSize: MyFonts.chipTextSize,
                            ),
                          )),
                      SizedBox(height: 3.h),
                      Text(
                        '\$${brandCar.price}',
                        style: TextStyle(
                          fontSize: MyFonts.body2TextSize,color: LightThemeColors.primaryColor
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
