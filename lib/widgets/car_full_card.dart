import 'package:carstore_car/app/cars/controllers/car_controller.dart';
import 'package:carstore_car/app/home/model/home_response.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarsFullCard extends GetView<CarController> {
  const CarsFullCard({super.key, required this.car});

  final SliderModel car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9, // Adjust the aspect ratio as needed.
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(left: 0,right: 0,top: 0,child: Image.network(car.image, fit: BoxFit.fill),),
              Positioned(
                left: 20.w,
                bottom: 20.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: .8,
                      child: Text(
                        car.title,
                        style: TextStyle(
                          fontSize: MyFonts.headline6TextSize,
                          color: LightThemeColors.backgroundColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      car.title,//
                      style: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        fontWeight: FontWeight.bold,
                        color: LightThemeColors.backgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
