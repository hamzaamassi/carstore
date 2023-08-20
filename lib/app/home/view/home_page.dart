// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:carstore/app/app_bottom_bar/controller/app_bottom_bar_controller.dart';
import 'package:carstore/app/news/model/news_list.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/translations/strings_enum.dart';
import 'package:carstore/routes/app_pages.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/brand_mini_card.dart';
import 'package:carstore/widgets/brand_quick_mini_card.dart';
import 'package:carstore/widgets/calculate_list_height.dart';
import 'package:carstore/widgets/car_list_full_card.dart';
import 'package:carstore/widgets/car_mini_card.dart';
import 'package:carstore/widgets/car_mini_upcoming_card.dart';
import 'package:carstore/widgets/car_news_card.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/general_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends GetView<AppBottomBarController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBottomBarController>(
        init: AppBottomBarController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: LightThemeColors.primaryColor,
                ))
              : Scaffold(
                  body: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: getSearch(
                            leadingIcon: AppIcons.underRow,
                            leadingData: const Text(Strings.bangkok),
                            leadingOnTap: () {},
                            trailingIcon: AppIcons.chat,
                            trailingOnTap: () {},
                            circleAvatarColor: LightThemeColors.backgroundColor,
                            isSearch: true,
                            size: 8,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  CarsListFullCard(
                                    slider: controller.sliderList,
                                  ),
                                  SizedBox(height: 25.h),
                                  GeneralListHorizontalCard(
                                    title: null,
                                    list: controller.brandList,
                                    onClickMoreText: () =>
                                        Get.toNamed(Routes.brandDetails),
                                    showMoreText: null,
                                    itemBuilder: (BuildContext, int) {
                                      final list = controller.brandList[int];
                                      return BrandQuickMiniCard(brand: list);
                                    },
                                    separator: 10,
                                    heightSizedBox: 30,
                                  ),
                                  SizedBox(height: 28.h),
                                  GeneralListHorizontalCard(
                                    title: Strings.topDeal.tr,
                                    onClickMoreText: () =>
                                        Get.toNamed(Routes.car),
                                    list: controller.carList,
                                    itemBuilder: (BuildContext, int) {
                                      final list = controller.carList[int];
                                      return CarsMiniCard(car: list);
                                    },
                                    separator: 15,
                                    heightSizedBox: 225,
                                  ),
                                  SizedBox(height: 28.h),
                                  GeneralListHorizontalCard(
                                    title: Strings.popularBrands.tr,
                                    list: controller.brandList,
                                    onClickMoreText: () =>
                                        Get.toNamed(Routes.brand),
                                    itemBuilder: (BuildContext, int) {
                                      final list = controller.brandList[int];
                                      return BrandMiniCard(brand: list);
                                    },
                                    separator: 15,
                                    heightSizedBox: 102,
                                  ),
                                  SizedBox(height: 28.h),
                                  GeneralListHorizontalCard(
                                    title: Strings.upcoming.tr,
                                    list: controller.carList,
                                    onClickMoreText: () =>
                                        Get.toNamed(Routes.car),
                                    itemBuilder: (BuildContext, int) {
                                      final list = controller.carList[int];
                                      return CarsMiniUpcomingCard(car: list);
                                    },
                                    separator: 25,
                                    heightSizedBox: 200,
                                  ),
                                  SizedBox(height: 28.h),
                                  GeneralListHorizontalCard(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    title: Strings.news.tr,
                                    onClickMoreText: () =>
                                        Get.toNamed(Routes.news),
                                    scrollDirection: Axis.vertical,
                                    list: NewsList,
                                    itemBuilder: (BuildContext, index) {
                                      final list = NewsList[index];
                                      return CarNewsCard(news: list);
                                    },
                                    separator: 15,
                                    heightSizedBox:
                                        calculateListHeight(NewsList, 90, 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
