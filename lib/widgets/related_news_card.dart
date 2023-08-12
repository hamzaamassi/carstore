import 'package:carstore_car/app/news/model/news.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RelatedNewsCard extends StatelessWidget {
  final News news;

  const RelatedNewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.newsReview),
      //,
      //         arguments: NewsReviewPage(news: news),
      child: Container(
        height: 86.h,
        decoration: BoxDecoration(
            color: LightThemeColors.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(5.r)),
        padding: EdgeInsets.all(10.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.news!,
                  style: TextStyle(
                    fontSize: MyFonts.body2TextSize,
                    color: LightThemeColors.iconColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "By ${news.author!}",
                      style: TextStyle(
                        fontSize: MyFonts.headline6TextSize,
                        color: LightThemeColors.scaffoldBackgroundColor,
                      ),
                    ),
                    Text(
                      news.createdPublish!,
                      style: TextStyle(
                        fontSize: MyFonts.headline6TextSize,
                        color: LightThemeColors.scaffoldBackgroundColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Image.asset(
              news.image!,
              height: 66.h,
              width: 66.w,
            )
          ],
        ),
      ),
    );
  }
}
