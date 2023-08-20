import 'package:carstore/app/cars/controllers/car_controller.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/calculate_grid_height.dart';
import 'package:carstore/widgets/car_compare_card.dart';
import 'package:carstore/widgets/custom_outline_button.dart';
import 'package:carstore/widgets/general_list_grid_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CarsComparePage extends GetView<CarController> {
  const CarsComparePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarController>(
      init: CarController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: LightThemeColors.scaffoldBackgroundColor,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
                child: getSearch(
                  isSearch: false,
                  size: 13,
                  text: 'Compare Cars',
                  leadingIcon: AppIcons.backtrackIcon,
                  leadingColor: LightThemeColors.dividerColor,
                  leadingOnTap: () => {},
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            Container(
                              width: 90.w,
                              height: 90.w,
                              decoration: BoxDecoration(
                                  color: LightThemeColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(15),image: DecorationImage(image: AssetImage(AppIcons.carPic))),

                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Porsche 718",
                                  style: TextStyle(
                                    fontSize: MyFonts.sectionListTitle,
                                    fontWeight: FontWeight.bold,
                                    color: LightThemeColors.iconColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  "Porsche/Luxury/The 2.3L EcoBoost",
                                  style: TextStyle(
                                    fontSize: MyFonts.chipTextSize,
                                    color: LightThemeColors.dividerColor,
                                  ),
                                ),
                                SizedBox(height: 13.h),
                                Text(
                                  "\$62,000.00-\$74,000.00",
                                  style: TextStyle(
                                    fontSize: MyFonts.body2TextSize,
                                    color: LightThemeColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      CustomOutlineButton(
                        onTap: () => {},
                        width: 335,
                        height: 44,
                        text: '+ Add Cars',
                      ),
                      SizedBox(height: 30.h),

                      Container(
                        decoration: BoxDecoration(
                          color: LightThemeColors.backgroundColor,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        padding: EdgeInsets.only(top: 20.h, right: 20.w, left: 20.w),
                        width: double.infinity,
                        child: GeneralListGridCard(
                          physics: NeverScrollableScrollPhysics(),
                          list: controller.cars,
                          heightSizedBox: calculateGridHeight(controller.cars, 190, 20, 2),
                          mainAxisExtent: 200,
                          showMoreText: '',
                          title: 'Select Similar Cars',
                          crossAxisSpacing: 15,
                          style: TextStyle(
                              color: LightThemeColors.dividerColor,
                              fontSize: MyFonts.body2TextSize),
                          itemBuilder: (context, index) {
                            final list = controller.cars[index];
                            return CarCompareCard(car: list);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

  }
}
