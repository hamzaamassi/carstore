// ignore_for_file: deprecated_member_use

import 'package:e_commerce_car/app/news/controllers/news_controller.dart';
import 'package:e_commerce_car/app/news/widget/hot_tab_widget.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/custom_outline_button.dart';
import 'package:e_commerce_car/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsReviewPage extends GetView<NewsController> {
  const NewsReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      // bottomNavigationBar: _bottomNavigationBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: getSearch(
              isSearch: false,
              size: 14,
              text: 'Review',
              leadingIcon: AppIcons.backtrackIcon,
              leadingOnTap: () => {},
              circleAvatarColor: LightThemeColors.scaffoldBackgroundColor,
              trailingIcon: AppIcons.share,
              trailingOnTap: () => {},
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
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
                                      AppIcons.placeHolder,
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
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    decoration: BoxDecoration(
                      color: LightThemeColors.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 18.h),
                      child: SizedBox(
                        width: double.infinity.w,
                        height: 544.h,
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 200),
                                // Limit tab bar width
                                child: const TabBar(
                                  isScrollable: true,
                                  // Set this to true
                                  labelColor: LightThemeColors.primaryColor,
                                  labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  unselectedLabelStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  unselectedLabelColor:
                                      LightThemeColors.dividerColor,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  indicatorWeight: 3,
                                  indicatorColor: LightThemeColors.primaryColor,

                                  tabs: [
                                    Tab(text: 'Hot'),
                                    Tab(text: 'Latest'),
                                    // Add more tabs as needed
                                  ],
                                ),
                              ),
                              const Expanded(
                                child: TabBarView(
                                  children: [
                                    // Your content for Tab 1
                                    HotTapWidget(),
                                    // Your content for Tab 2
                                    Center(child: Text('Tab 2 Content')),
                                    // Your content for Tab 3
                                    // Add more content widgets as needed
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _bottomNavigationBar() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(15.r),
  //           topRight: Radius.circular(15.r),
  //         ),
  //         color: LightThemeColors.scaffoldBackgroundColor),
  //     height: 83.h,
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Expanded(
  //             child: Container(
  //               height: 30.h,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(25.r),
  //                 color: LightThemeColors.backgroundColor,
  //               ),
  //               child: TextField(
  //                 // onChanged: onChange,
  //                 style: const TextStyle(
  //                   color: LightThemeColors.dividerColor,
  //                 ),
  //                 decoration: InputDecoration(
  //                   hintText: 'Say Something',
  //                   border: InputBorder.none,
  //                   hintStyle: const TextStyle(
  //                     color: LightThemeColors.dividerColor,
  //                     fontSize: 14,
  //                   ),
  //                   prefixIcon: Padding(
  //                     padding: const EdgeInsets.all(6.0),
  //                     child: SvgPicture.asset(
  //                       AppIcons.pin,
  //                       color: LightThemeColors.dividerColor,
  //                       height: 12,
  //                       width: 12,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           SizedBox(width: 20.w),
  //           GestureDetector(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SvgPicture.asset(AppIcons.comment),
  //                 SizedBox(height: 2.8.h),
  //                 Text('47', style: TextStyle(fontSize: MyFonts.smallTextSize))
  //               ],
  //             ),
  //             onTap: () => {},
  //           ),
  //           SizedBox(width: 20.w),
  //           GestureDetector(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SvgPicture.asset(AppIcons.like),
  //                 SizedBox(height: 2.8.h),
  //                 Text(
  //                   '248',
  //                   style: TextStyle(fontSize: MyFonts.smallTextSize),
  //                 )
  //               ],
  //             ),
  //             onTap: () => {},
  //           ),
  //           SizedBox(width: 20.w),
  //           GestureDetector(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 SvgPicture.asset(AppIcons.star),
  //                 SizedBox(height: 2.8.h),
  //                 Text(
  //                   'Collect',
  //                   style: TextStyle(fontSize: MyFonts.smallTextSize),
  //                 )
  //               ],
  //             ),
  //             onTap: () => {},
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
