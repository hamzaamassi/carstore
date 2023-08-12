// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:e_commerce_car/app/home/controllers/home_controller.dart';
import 'package:e_commerce_car/app/news/model/news_list.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/translations/strings_enum.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/brand_mini_card.dart';
import 'package:e_commerce_car/widgets/brand_quick_mini_card.dart';
import 'package:e_commerce_car/widgets/calculate_list_height.dart';
import 'package:e_commerce_car/widgets/car_list_full_card.dart';
import 'package:e_commerce_car/widgets/car_mini_card.dart';
import 'package:e_commerce_car/widgets/car_mini_upcoming_card.dart';
import 'package:e_commerce_car/widgets/car_news_card.dart';
import 'package:e_commerce_car/widgets/general_list_horizontal_card.dart';
import 'package:e_commerce_car/widgets/general_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
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
                          car: controller.sliderList,
                        ),
                      SizedBox(height: 25.h),
                      GeneralListHorizontalCard(
                          title: null,
                          list: controller.brandList,
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
                          itemBuilder: (BuildContext, int) {
                            final list = controller.carList[int];
                            return CarsMiniUpcomingCard(car: list);
                          },
                          separator: 25,
                          heightSizedBox: 200,
                        ),
                      SizedBox(height: 28.h),
                     GeneralListHorizontalCard(
                          physics: const NeverScrollableScrollPhysics(),
                          title: Strings.news.tr,
                          scrollDirection: Axis.vertical,
                          list: NewsList,
                          itemBuilder: (BuildContext, index) {
                            final list = NewsList[index];
                            return CarNewsCard(news: list);
                          },
                          separator: 15,
                          heightSizedBox: calculateListHeight(NewsList, 90, 15),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );});
  }

}
