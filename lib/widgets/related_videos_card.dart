import 'package:carstore_car/app/video/models/video.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RelatedVideosCard extends StatelessWidget {
  final Video videos;

  const RelatedVideosCard({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.videosReview,

      ),
      // arguments: VideoReviewPage(videos: videos),
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
                  videos.news!,
                  style: TextStyle(
                    fontSize: MyFonts.body2TextSize,
                    color: LightThemeColors.iconColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "By ${videos.author!}",
                      style: TextStyle(
                        fontSize: MyFonts.headline6TextSize,
                        color: LightThemeColors.scaffoldBackgroundColor,
                      ),
                    ),
                    Text(
                      videos.createdPublish!,
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
              videos.image!,
              height: 66.h,
              width: 66.w,
            )
          ],
        ),
      ),
    );
  }
}
