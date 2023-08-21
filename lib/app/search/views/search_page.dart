// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:carstore/app/search/controllers/search_controller.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/calculate_list_height.dart';
import 'package:carstore/widgets/car_search_card.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchProductController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
// int height = calculateListHeight(ListCar, 92, 20);
    Get.put(SearchProductController);
    List history = [
      '3 Series Gt',
      '3 Series Gt',
      '3 Series Gt',
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            getSearch(
              isSearch: true,
              size: 13,
              leadingIcon: AppIcons.closeIcon,
              suffixIcon: AppIcons.voice,
              circleAvatarColor: LightThemeColors.backgroundColor,
              leadingOnTap: () => {},
              suffixOnTap: () => {},
            ),
            SizedBox(height: 38.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'History',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MyFonts.sectionListTitle),
                        ),
                        GestureDetector(
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.delete),
                              SizedBox(width: 7.w),
                              const Opacity(
                                opacity: .8,
                                child: Text('Clear History'),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 28.h),
                    GeneralListHorizontalCard(
                        showMoreText: null,
                        list: history,
                        itemBuilder: (BuildContext, index) {
                          return controller.buildHistory(context, index, history);
                        },
                        separator: 15,
                        heightSizedBox: 34),
                    SizedBox(height: 48.h),
                    SizedBox(
                      height: 556.h,
                      width: double.infinity,
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 250.w),
                                  child: const TabBar(
                                    isScrollable: true, // Set this to true
                                    labelColor: LightThemeColors.primaryColor,
                                    labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    unselectedLabelColor: LightThemeColors.dividerColor,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicatorWeight: 3,
                                    indicatorColor: LightThemeColors.primaryColor,
                                    tabs: [
                                      Tab(text: 'Sales'),
                                      Tab(text: 'Hot'),
                                    ],
                                  ),
                                ),
                                Opacity(
                                  opacity: .8,
                                  child: Row(
                                    children: const [
                                      Text('Dec,2020'),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  // GeneralListHorizontalCard(
                                  //   showMoreText: null,
                                  //   list: ListCar,
                                  //   physics: const NeverScrollableScrollPhysics(),
                                  //   scrollDirection: Axis.vertical,
                                  //   itemBuilder: (BuildContext, index) {
                                  //     final list = ListCar[index];
                                  //     return CarSearchCard(car: list);
                                  //   },
                                  //   separator: 20,
                                  //   heightSizedBox:
                                  //   height,
                                  // ),
                                  Container(),
                                  Container()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
