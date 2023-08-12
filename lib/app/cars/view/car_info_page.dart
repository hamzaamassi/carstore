// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:e_commerce_car/app/cars/controllers/car_info_controller.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/general_list_horizontal_card.dart';
import 'package:e_commerce_car/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarInfoPage extends GetView<CarInfoController> {
  const CarInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CarInfoController());
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: getSearch(
                isSearch: false,
                size: 14,
                leadingIcon: AppIcons.backtrackIcon,
                leadingColor: LightThemeColors.dividerColor,
                leadingOnTap: () => {},
                trailingIcon: AppIcons.share,
                trailingOnTap: () => {},
                trailingColor: LightThemeColors.dividerColor,
                circleAvatarColor: Colors.transparent,
                center: GestureDetector(
                  onTap: () => {},
                  child: const Row(
                    children: [
                      Text('2020 Cayman T'),
                      // SvgPicture.asset(AppIcons.backtrackIcon),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: LightThemeColors.dividerColor,
                      )
                    ],
                  ),
                )),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onPanUpdate: (details) {
                      controller.changeValueOfTransform(
                          details.delta.dy * 0.01, details.delta.dx * 0.01);
                    },
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(controller.rotationY),
                      alignment: FractionalOffset.center,
                      child: Image.network(
                        'https://d2t1xqejof9utc.cloudfront.net/screenshots/pics/51c2cf1a90c50f2ea558c24207d2e107/large.png',
                        width: 400.w,
                        height: 150.h,
                        fit: BoxFit.contain,
                      ), // Replace with your image path
                    ),
                  ),
                  SizedBox(height: 6.h),
                  GeneralListHorizontalCard(
                    heightSizedBox: 15,
                    showMoreText: null,
                    separator: 20,
                    itemBuilder: (BuildContext, index) {
                      return controller.bulidItems(context, index);
                    },
                    list: controller.myColors,
                  ),
                  SizedBox(height: 23.h),
                  controller.bulidSecondItemList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
