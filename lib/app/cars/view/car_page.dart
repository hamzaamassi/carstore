// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:carstore/app/app_bottom_bar/controller/app_bottom_bar_controller.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/translations/strings_enum.dart';
import 'package:carstore/routes/app_pages.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/brand_quick_mini_card.dart';
import 'package:carstore/widgets/calculate_grid_height.dart';
import 'package:carstore/widgets/car_offer_card.dart';
import 'package:carstore/widgets/general_list_grid_card.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarPage extends GetView<AppBottomBarController> {
  const CarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBottomBarController>(
        init: AppBottomBarController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: LightThemeColors.primaryColor,
                  ),
                )
              : Scaffold(
                  body: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getSearch(
                          size: 8,
                          leadingIcon: AppIcons.underRow,
                          leadingData: const Text(Strings.bangkok),
                          leadingOnTap: () {},
                          circleAvatarColor: LightThemeColors.backgroundColor,
                          trailingColor: LightThemeColors.primaryColor,
                          trailingIcon: AppIcons.filter,
                          trailingOnTap: () =>
                              {Get.toNamed(Routes.searchBrand)},
                          isSearch: true,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  // SizedBox(height: 30.h),
                                  GeneralListHorizontalCard(
                                    list: controller.brands,
                                    showMoreText: null,
                                    itemBuilder: (context, index) {
                                      final list = controller.brands[index];
                                      return BrandQuickMiniCard(brand: list);
                                    },
                                    separator: 10,
                                    heightSizedBox: 30,
                                  ),
                                  SizedBox(height: 28.h),
                                  GeneralListGridCard(
                                    title: Strings.topDeal.tr,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    list: controller.cars,
                                    itemBuilder: (BuildContext, int) {
                                      final car = controller.cars[int];
                                      print("sam car $int ${car.toJson()}");
                                      return CarsOfferCard(car: car);
                                    },
                                    heightSizedBox: calculateGridHeight(
                                        controller.cars, 235, 20, 2),
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
