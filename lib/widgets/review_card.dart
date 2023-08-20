// ignore_for_file: dead_code

import 'package:carstore/app/news/model/review_news.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.reviews});

  final ReviewNews reviews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    reviews.image!,
                    height: 30.h,
                    width: 30.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    reviews.author!,
                    style: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        color: LightThemeColors.dividerColor),
                  ),
                  Text(
                    " .${reviews.createdPublish} hours",
                    style: TextStyle(
                        fontSize: MyFonts.chipTextSize,
                        color: LightThemeColors.captionTextColor),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => reviews.isLike = !reviews.isLike!,
                child: Row(
                  children: [
                    Text(
                      reviews.countLike!.toString(),
                      style: TextStyle(
                          color: reviews.isLike!
                              ? LightThemeColors.primaryColor
                              : LightThemeColors.dividerColor),
                    ),
                    SizedBox(width: 7.w),
                    SvgPicture.asset(
                      reviews.isLike! ? AppIcons.selectedLike : AppIcons.like,
                      height: 12.h,
                      width: 12.w,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 41.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviews.news!,
                  style: TextStyle(
                      fontSize: MyFonts.headline6TextSize,
                      color: LightThemeColors.iconColor),
                ),
                SizedBox(height: 10.h),
                Text(
                  '${reviews.countReply} Replay',
                  style: TextStyle(
                      color: LightThemeColors.primaryColor,
                      fontSize: MyFonts.chipTextSize),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
