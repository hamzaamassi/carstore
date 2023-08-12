import 'package:carstore_car/app/auto_part/models/auto_part.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemAutoPartCard extends StatelessWidget {
  const ItemAutoPartCard({Key? key, required this.autoPart}) : super(key: key);

  // final Car car;
  final AutoPart autoPart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.toNamed(Routes.newsDetails),
      //,arguments: NewsDetailsPage(news: news),
      child: Container(
        width: double.infinity.w,
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: LightThemeColors.scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0.h,
              bottom: 0.h,
              left: 10.w,
              child: Image.asset(autoPart.image!, height: 80.h, width: 80.w),
            ),
            Positioned(
              left: 105.w,
              top: 10.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    autoPart.name ?? '',
                    style: TextStyle(
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Opacity(
                      opacity: .8,
                      child: Row(
                        children: [
                          Text(
                            'By ${autoPart.opacityTitle}',
                            style: TextStyle(
                              fontSize: MyFonts.headline6TextSize,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '\$ ${autoPart.price}',
                            style: TextStyle(
                              fontSize: MyFonts.headline6TextSize,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 3.h),
                  Text(
                    '\$${autoPart.price}',
                    style: TextStyle(
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.primaryColor,
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
