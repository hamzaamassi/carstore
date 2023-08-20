// ignore_for_file: must_be_immutable

import 'package:carstore/app/cars/controllers/car_controller.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/widgets/calculate_grid_height.dart';
import 'package:carstore/widgets/calculate_list_height.dart';
import 'package:carstore/widgets/custom_primary_button.dart';
import 'package:carstore/widgets/general_list_grid_card.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PriceTabsWidget extends GetView<CarController> {
  PriceTabsWidget({super.key});

  List list = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GeneralListHorizontalCard(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            separator: 21,
            showMoreText: null,
            list: list,
            itemBuilder: bulidFourItemList,
            heightSizedBox: calculateListHeight(list, 55, 21),
          ),
          GeneralListGridCard(
            title: 'Recommend for you',
            style: TextStyle(
              fontSize: MyFonts.body2TextSize,
              color: LightThemeColors.dividerColor,
            ),
            physics: const NeverScrollableScrollPhysics(),
            list: controller.cars,
            heightSizedBox: calculateGridHeight(controller.cars, 83, 30, 3),
            crossAxisCount: 3,
            mainAxisSpacing: 23,
            mainAxisExtent: 78,
            crossAxisSpacing: 30,
            itemBuilder: bulidGridItemList,
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

  Widget bulidGridItemList(context, index) => Column(
        children: [
          Image.network(
            controller.cars[index].image,
            height: 50.h,
            width: 80.w,
          ),
          Text(
            controller.cars[index].name,
            style: TextStyle(fontSize: MyFonts.chipTextSize),
          ),
        ],
      );

  Widget bulidFourItemList(context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("500h Luxury",
                      style: TextStyle(
                          fontSize: MyFonts.body2TextSize,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Text("3456 cc,Automatic,Petrol,15.4kmpl",
                      style: TextStyle(fontSize: MyFonts.chipTextSize)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Text(
                      "\$456,800",
                      style: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        color: LightThemeColors.primaryColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Compare",
                        style: TextStyle(fontSize: MyFonts.headline6TextSize),
                      ),
                      Checkbox(
                        activeColor: LightThemeColors.primaryColor,
                        side: BorderSide(
                          color: LightThemeColors.dividerColor,
                          style: BorderStyle.solid,
                          strokeAlign: 0.1.h,
                        ),
                        value: controller.isChecked,
                        onChanged: (bool? value) {
                          controller.changeValueOfCheckBox(value!);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const Divider(height: 1, color: LightThemeColors.dividerColor)
        ],
      );
}
