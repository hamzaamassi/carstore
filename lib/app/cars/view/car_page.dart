// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/translations/strings_enum.dart';
import 'package:e_commerce_car/routes/app_pages.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/brand_quick_mini_card.dart';
import 'package:e_commerce_car/widgets/calculate_grid_height.dart';
import 'package:e_commerce_car/widgets/car_offer_card.dart';
import 'package:e_commerce_car/widgets/general_list_grid_card.dart';
import 'package:e_commerce_car/widgets/general_list_horizontal_card.dart';
import 'package:e_commerce_car/app/cars/controllers/car_controller.dart';
import 'package:e_commerce_car/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarPage extends GetView<CarController> {
  const CarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarController controller = Get.find<CarController>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w,right:  20.w,top:  20.h),
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
              trailingOnTap: () => {Get.toNamed(Routes.searchBrand)},
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
                      // GeneralListHorizontalCard(
                      //   list: controller.brands,
                      //   showMoreText: null,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   itemBuilder: (context, index) {
                      //     final list = controller.brands[index];
                      //     return BrandQuickMiniCard(brand: list);
                      //   },
                      //   separator: 10,
                      //   heightSizedBox: 30,
                      // ),
                      SizedBox(height: 28.h),
                      GeneralListGridCard(
                        title: Strings.topDeal.tr,
                        physics: const NeverScrollableScrollPhysics(),
                        list: controller.cars,
                        itemBuilder: (BuildContext, int) {
                          final car = controller.cars[int];
                          return CarsOfferCard(car: car);
                        },
                        heightSizedBox:
                            calculateGridHeight(controller.cars, 225, 20, 2).toInt(),
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
  }
}