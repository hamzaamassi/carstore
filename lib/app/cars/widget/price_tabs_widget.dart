import 'package:e_commerce_car/app/cars/controllers/car_details_controller.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/widgets/calculate_grid_height.dart';
import 'package:e_commerce_car/widgets/calculate_list_height.dart';
import 'package:e_commerce_car/widgets/custom_primary_button.dart';
import 'package:e_commerce_car/widgets/general_list_grid_card.dart';
import 'package:e_commerce_car/widgets/general_list_horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PriceTabsWidget extends GetView<CarDetailsController> {
  const PriceTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralListHorizontalCard(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          separator: 21,
          showMoreText: null,
          list: controller.cars,
          itemBuilder: bulidFourItemList,
          heightSizedBox: calculateListHeight(controller.cars, 50, 21),
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
    );
  }

  Widget bulidGridItemList(context, index) => Column(
        children: [
          Image.network(
            "https://s7d1.scene7.com/is/image/hyundai/2023-ioniq-6-limited-rwd-transmission-blue-pearl-profile:Vehicle-Carousel?fmt=webp-alpha",
            height: 50.h,
            width: 80.w,
          ),
          Text(
            "Mercedes SLC",
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
