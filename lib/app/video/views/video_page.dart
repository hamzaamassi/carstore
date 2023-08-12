// ignore_for_file: deprecated_member_use

import 'package:carstore_car/app/video/controllers/video_controller.dart';
import 'package:carstore_car/app/video/models/video_list.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/widgets/calculate_list_height.dart';
import 'package:carstore_car/widgets/custom_outline_button.dart';
import 'package:carstore_car/widgets/general_list_horizontal_card.dart';
import 'package:carstore_car/widgets/general_search.dart';
import 'package:carstore_car/widgets/related_videos_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends GetView<VideoController> {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      bottomNavigationBar: _bottomNavigationBar(),
      body: Stack(
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
          Padding(
            padding: const EdgeInsets.only(top: 294),
            child: Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2019 Macan Facelift Launched; More Affordable Than Before",
                      style: TextStyle(
                        fontSize: MyFonts.sectionListTitle,
                        color: LightThemeColors.iconColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 40.w,
                              height: 40.h,
                              child: CircleAvatar(
                                radius: 50.r,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(AppIcons.placeHolder),
                              ),
                            ),
                            SizedBox(width: 11.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Abbey',
                                  style: TextStyle(
                                      fontSize: MyFonts.body2TextSize,
                                      color: LightThemeColors.iconColor),
                                ),
                                Text(
                                  'Aug 31,2020 / 89623 Views',
                                  style: TextStyle(
                                      fontSize: MyFonts.chipTextSize,
                                      color: LightThemeColors.dividerColor),
                                )
                              ],
                            )
                          ],
                        ),
                        CustomOutlineButton(onTap: () => {})
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: LightThemeColors.scaffoldBackgroundColor,
                      ),
                      height: 60.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppIcons.carPic),
                                SizedBox(width: 15.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Porsche-Taycan',
                                      style: TextStyle(
                                          fontSize: MyFonts.body2TextSize,
                                          fontWeight: FontWeight.bold,
                                          color: LightThemeColors.iconColor),
                                    ),
                                    Text(
                                      'McLaren/Luxury',
                                      style: TextStyle(
                                          fontSize: MyFonts.chipTextSize,
                                          color: LightThemeColors.dividerColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$634.800",
                                  style: TextStyle(
                                      color: LightThemeColors.primaryColor,
                                      fontSize: MyFonts.body2TextSize),
                                ),
                                Text(
                                  "price",
                                  style: TextStyle(
                                      color: LightThemeColors.dividerColor,
                                      fontSize: MyFonts.chipTextSize),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Text(
                      "Related",
                      style: TextStyle(
                          fontSize: MyFonts.sectionListTitle,
                          color: LightThemeColors.iconColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 19.h),
                    GeneralListHorizontalCard(
                        list: VideoList,
                        showMoreText: null,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var video = VideoList[index];
                          return RelatedVideosCard(videos: video);
                        },
                        separator: 15,
                        heightSizedBox: calculateListHeight(VideoList,93,15),)
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
            SizedBox(width: 20.w),
            GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.comment),
                  SizedBox(height: 2.8.h),
                  Text('47', style: TextStyle(fontSize: MyFonts.smallTextSize))
                ],
              ),
              onTap: () => {},
            ),
            SizedBox(width: 20.w),
            GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.like),
                  SizedBox(height: 2.8.h),
                  Text(
                    '248',
                    style: TextStyle(fontSize: MyFonts.smallTextSize),
                  )
                ],
              ),
              onTap: () => {},
            ),
            SizedBox(width: 20.w),
            GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.star),
                  SizedBox(height: 2.8.h),
                  Text(
                    'Collect',
                    style: TextStyle(fontSize: MyFonts.smallTextSize),
                  )
                ],
              ),
              onTap: () => {},
            )
          ],
        ),
      ),
    );
  }
}
