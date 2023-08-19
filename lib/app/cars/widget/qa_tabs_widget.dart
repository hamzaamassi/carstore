// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, must_be_immutable

import 'package:carstore_car/app/cars/controllers/car_controller.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/widgets/calculate_list_height.dart';
import 'package:carstore_car/widgets/custom_primary_button.dart';
import 'package:carstore_car/widgets/general_list_horizontal_card.dart';
import 'package:carstore_car/widgets/qa_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QATabsWidget extends GetView<CarController> {
  QATabsWidget( {super.key});
    List list = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: LightThemeColors.scaffoldBackgroundColor,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w, end: 15.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.qa,
                    width: 45,
                    height: 34,
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Have any question?",
                        style: TextStyle(
                            fontSize: MyFonts.body2TextSize,
                            color: LightThemeColors.iconColor),
                      ),
                      SizedBox(height: 3.h),
                      Text("Click the button ",
                          style: TextStyle(
                              fontSize: MyFonts.headline6TextSize,
                              color: LightThemeColors.dividerColor)),
                    ],
                  ),
                  SizedBox(width: 44.w),
                  CustomPrimaryButton(
                    size: MyFonts.body2TextSize,
                    text: 'Ask Now',
                    onTap: () => {},
                    width: 70,
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GeneralListHorizontalCard(
            list: list,
            scrollDirection: Axis.vertical,
            showMoreText: null,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext, index) => const QAItemCard(),
            separator: 15,
            heightSizedBox: calculateListHeight(
              list,
              177,
              15,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h, top: 20.h),
            child: CustomPrimaryButton(
              onTap: () {
                controller.changeValueOfOffers(true);
              },
              text: "Get Offers from Dealer",
            ),
          ),
        ],
      ),
    );
  }
}
