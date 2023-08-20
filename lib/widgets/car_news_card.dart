import 'package:carstore/app/news/model/news.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarNewsCard extends StatelessWidget {
  const CarNewsCard({Key? key, required this.news}) : super(key: key);

  // final Car car;
  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.newsDetails),
      //,arguments: NewsDetailsPage(news: news),
      child: Container(
        width: 335.w,
        height: 86.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: LightThemeColors.cardColor,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0.h,
              bottom: 0.h,
              right: 10.w,
              child: Image.asset(news.image!, height: 66.h, width: 66.w),
            ),
            Positioned(
              left: 10.w,
              top: 10.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.news ?? '',
                    style: TextStyle(
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  Opacity(
                      opacity: .8,
                      child: Row(
                        children: [
                          Text(
                            'By ${news.author}',
                            style: TextStyle(
                              fontSize: MyFonts.headline6TextSize,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '\$ ${news.createdPublish}',
                            style: TextStyle(
                              fontSize: MyFonts.headline6TextSize,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
