// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:carstore/app/brand/controller/brand_controller.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/translations/strings_enum.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/alphabet_scroll_view_brand.dart';
import 'package:carstore/widgets/brand_details_card.dart';
import 'package:carstore/widgets/calculate_grid_height.dart';
import 'package:carstore/widgets/general_list_grid_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrandPage extends GetView<BrandController> {
  const BrandPage({super.key});

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
                  backgroundColor: LightThemeColors.backgroundColor,
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: getSearch(
                            size: 14,
                            isSearch: false,
                            leadingIcon: AppIcons.backtrackIcon,
                            text: 'Brands',
                          ),
                        ),
                        SizedBox(height: 34.h),
                        Expanded(
                          child: GeneralListGridCard(
                            physics: const NeverScrollableScrollPhysics(),
                            list: controller.brands,
                            itemBuilder: (BuildContext, int) {
                              final list = controller.brands[int];
                              return BrandPageCard(brand: list);
                            },
                            crossAxisCount: 4,
                            mainAxisExtent: 75,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 11,
                            heightSizedBox: calculateGridHeight(
                                controller.brands, 75, 11, 2),
                            title: Strings.popularBrands.tr,
                          ),
                        ),
                        const Expanded(child: AlphabetScrollViewBrand())
                      ],
                    ),
                  ),
                );
        });
  }
}
