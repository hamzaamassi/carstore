import 'package:carstore/app/video/models/video.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarVideoCard extends StatelessWidget {
  const CarVideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 125.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 124.h,
              width: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: LightThemeColors.backgroundColor,
              ),
              child: Image.asset(video.image!, fit: BoxFit.cover),

          ),
          SizedBox(height: 6.h),
          Text(
            video.news!,
            style: TextStyle(
                fontSize: MyFonts.body2TextSize,
                color: LightThemeColors.iconColor),
          ),
        ],
      ),
    );
  }
}
