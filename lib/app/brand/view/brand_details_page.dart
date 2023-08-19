// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:carstore_car/app/brand/controller/brand_controller.dart';
import 'package:carstore_car/app/brand/widget/all_tab_widget.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/widgets/car_similar_card.dart';
import 'package:carstore_car/widgets/general_list_horizontal_card.dart';
import 'package:carstore_car/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrandDetailsPage extends GetView<BrandController> {
  const BrandDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BrandController>(
        init: BrandController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: LightThemeColors.primaryColor,
                  ),
                )
              : Scaffold(
                  backgroundColor: LightThemeColors.scaffoldBackgroundColor,
                  body: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getSearch(
                          size: 14,
                          isSearch: false,
                          leadingIcon: AppIcons.backtrackIcon,
                          text: '${controller.brandName}',
                        ),
                        SizedBox(height: 34.h),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                GeneralListHorizontalCard(
                                  heightSizedBox: 226,
                                  title: 'Hot',
                                  showMoreText: '',
                                  separator: 15,
                                  list: controller.cars,
                                  itemBuilder: (context, index) {
                                    final list = controller.cars[index];
                                    return CarSimilarCard(
                                      car: list,
                                    );
                                  },
                                ),
                                DefaultTabController(
                                  length: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 250.w),
                                        child: const TabBar(
                                          isScrollable: true,
                                          labelColor:
                                              LightThemeColors.primaryColor,
                                          labelStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          unselectedLabelStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          unselectedLabelColor:
                                              LightThemeColors.dividerColor,
                                          indicatorSize:
                                              TabBarIndicatorSize.label,
                                          indicatorWeight: 3,
                                          indicatorColor:
                                              LightThemeColors.primaryColor,
                                          tabs: [
                                            Tab(text: 'All'),
                                            Tab(text: 'Sedan'),
                                            Tab(text: 'SUV'),
                                            Tab(text: 'Luxury'),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      SizedBox(
                                        height: Get.height * 0.6,
                                        // You can adjust the height here as needed
                                        child: const TabBarView(
                                          children: [
                                            AllTapWidget(),
                                            Center(child: Text('Tab 2 Sedan')),
                                            Center(child: Text('Tab 3 SUV')),
                                            Center(child: Text('Tab 4 Luxury')),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
        });
  }
}
