import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchModelController extends GetxController {

  final count = 0.obs;

  Widget bulidFirstItems(context, index) => Container(
        height: 68.h,
        width: 101.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          image: const DecorationImage(
              image: NetworkImage(
                "https://www.autocar.co.uk/sites/autocar.co.uk/files/images/car-reviews/first-drives/legacy/99-best-luxury-cars-2023-bmw-i7-lead.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Container(
                height: 16.h,
                width: 46.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: LightThemeColors.iconColor.withOpacity(0.50),
                ),
                child: Center(
                  child: Text(
                    "Exterior",
                    style: TextStyle(
                        fontSize: MyFonts.smallTextSize,
                        color: LightThemeColors.backgroundColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget bulidSecondItems(context, index) => Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Theme.of(context).colorScheme.surface),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Porsche Type 997 911 GT2 RSR Flat ",
                    style: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        color: LightThemeColors.iconColor),
                  ),
                  Text("By Akshit ep 05,2020",
                      style: TextStyle(
                          fontSize: MyFonts.headline6TextSize,
                          color: LightThemeColors.dividerColor)),
                ],
              ),
              // const Spacer(),
              Container(
                width: 66.w,
                height: 66.w,
                decoration: BoxDecoration(
                  color: LightThemeColors.primaryColor,
                  image: const DecorationImage(
                      image: NetworkImage(
                        "https://www.autocar.co.uk/sites/autocar.co.uk/files/images/car-reviews/first-drives/legacy/99-best-luxury-cars-2023-bmw-i7-lead.jpg",
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ],
          ),
        ),
      );

  Widget bulidFiveItem(context, index) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "500h Luxury",
                style: TextStyle(
                    fontSize: MyFonts.body2TextSize,
                    color: LightThemeColors.iconColor),
              ),
              const Spacer(),
              Text(
                "\$456,800",
                style: TextStyle(
                    fontSize: MyFonts.body2TextSize,
                    color: LightThemeColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              "3456 cc,Automatic,Petrol,15.4kmpl",
              style: TextStyle(
                  fontSize: MyFonts.body2TextSize,
                  color: LightThemeColors.dividerColor),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            width: double.infinity,
            height: 1.h,
            color: LightThemeColors.agentColor,
          )
        ],
      );
}
