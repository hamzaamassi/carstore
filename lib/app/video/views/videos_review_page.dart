// ignore_for_file: deprecated_member_use

import 'package:e_commerce_car/app/news/widget/hot_tab_widget.dart';
import 'package:e_commerce_car/app/video/controllers/video_controller.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoReviewPage extends GetView<VideoController> {
  const VideoReviewPage({Key? key}) : super(key: key);

//, required Video videos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      bottomNavigationBar: _bottomNavigationBar(),
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
              width: double.infinity,
              height: 254.h,
              child: GetBuilder<VideoController>(
                builder: (controller) {
                  return YoutubePlayer(
                    controller: controller.youtubePlayerController,
                    showVideoProgressIndicator: true,
                    // Customize video options and settings
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                top: 30.h,
                left: 20,
                right: 20,
              ),
              child: getSearch(
                isSearch: false,
                size: 14,
                text: 'Review',
                leadingIcon: AppIcons.backtrackIcon,
                leadingOnTap: () => {},
                leadingColor: LightThemeColors.lightColor,
                circleAvatarColor: LightThemeColors.iconColor,
                trailingIcon: AppIcons.share,
                trailingColor: LightThemeColors.darkColor,
                trailingOnTap: () => {},
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 294,
            child: Text(
              "2019 Macan Facelift Launched; More Affordable Than Before",
              style: TextStyle(
                fontSize: MyFonts.sectionListTitle,
                color: LightThemeColors.iconColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            right: 0.w,
            left: 0.w,
            child: Container(
              height: 357.h,
              decoration: BoxDecoration(
                color: LightThemeColors.backgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Reviews'),
                        GestureDetector(
                          onTap: () => {},
                          child: SvgPicture.asset(AppIcons.closeIcon),
                        )
                      ],
                    ),
                    const Expanded(
                        child: SingleChildScrollView(
                      child: HotTapWidget(),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
          color: LightThemeColors.scaffoldBackgroundColor),
      height: 83.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: LightThemeColors.backgroundColor,
                ),
                child: TextField(
                  // onChanged: onChange,
                  style: const TextStyle(
                    color: LightThemeColors.dividerColor,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Say Something',
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: LightThemeColors.dividerColor,
                      fontSize: 14,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(
                        AppIcons.pin,
                        color: LightThemeColors.dividerColor,
                        height: 12,
                        width: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
