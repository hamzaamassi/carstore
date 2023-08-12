// ignore_for_file: deprecated_member_use

import 'package:e_commerce_car/app/news/controllers/news_controller.dart';
import 'package:e_commerce_car/app/news/model/news_list.dart';
import 'package:e_commerce_car/app/video/views/video_page.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/routes/app_pages.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/calculate_list_height.dart';
import 'package:e_commerce_car/widgets/custom_outline_button.dart';
import 'package:e_commerce_car/widgets/general_list_horizontal_card.dart';
import 'package:e_commerce_car/widgets/general_search.dart';
import 'package:e_commerce_car/widgets/related_news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NewsDetailsPage extends GetView<NewsController> {
  const NewsDetailsPage({Key? key}) : super(key: key);
//, required News news
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      bottomNavigationBar: _bottomNavigationBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: getSearch(
                isSearch: false,
                size: 14,
                text: 'News',
                leadingIcon: AppIcons.backtrackIcon,
                leadingOnTap: () => {},
                circleAvatarColor: LightThemeColors.scaffoldBackgroundColor,
                trailingIcon: AppIcons.share,
                trailingOnTap: () =>
                    {Get.toNamed(Routes.video, arguments: VideoPage())},
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 36.h),
                    Text(
                      "Porsche's First Electric Car Named Taycan; Will Rival Tesla Model S ",
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
                                child: Image.asset(
                                  AppIcons.carPic,
                                  fit: BoxFit.contain,
                                ),
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
                    Text(
                      "Porsche has announced the name of its Tesla Model S rival, the production-spec Mission"
                      " E concept. Called the Taycan, the electric sedan is all set to get into production"
                      " by next year, ahead of its international debut in 2020. The Taycan will be the first"
                      " electric car by Porsche and it will continue to be a performance-oriented sportscar "
                      " staying true to the Porsche tradition.",
                      style: TextStyle(
                          fontSize: MyFonts.headline6TextSize,
                          color: LightThemeColors.dividerColor),
                    ),
                    SizedBox(height: 10.h),
                    Image.asset(AppIcons.pic),
                    SizedBox(height: 10.h),
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
                    SizedBox(height: 20.h),
                    Text(
                      "Porsche says that the name Taycan roughly translates to"
                      " “lively young horse”, paying homage to the leaping horse"
                      " that has been featured on the brand’s crest logo since 1952.12",
                      style: TextStyle(
                          fontSize: MyFonts.headline6TextSize,
                          color: LightThemeColors.dividerColor),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: LightThemeColors.scaffoldBackgroundColor,
                      ),
                      width: 162.w,
                      height: 25.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Rate this  news',
                            style: TextStyle(fontSize: MyFonts.chipTextSize),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.star,
                                height: 10,
                                width: 10,
                              ),
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                AppIcons.star,
                                height: 10,
                                width: 10,
                              ),
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                AppIcons.star,
                                height: 10,
                                width: 10,
                              ),
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                AppIcons.star,
                                height: 10,
                                width: 10,
                              ),
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                AppIcons.star,
                                height: 10,
                                width: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 28.h),
                    GeneralListHorizontalCard(
                        list: NewsList,
                        title: 'Related',
                        physics: const NeverScrollableScrollPhysics(),
                        showMoreText: '',
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var news = NewsList[index];
                          return RelatedNewsCard(news: news);
                        },
                        separator: 15,
                        heightSizedBox: calculateListHeight(NewsList, 90, 15))
                  ],
                ),
              ),
            )
          ],
        ),
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
