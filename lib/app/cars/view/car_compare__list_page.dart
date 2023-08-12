import 'package:e_commerce_car/app/cars/controllers/car_compare_list_controller.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/calculate_list_height.dart';
import 'package:e_commerce_car/widgets/custom_outline_button.dart';
import 'package:e_commerce_car/widgets/custom_primary_button.dart';
import 'package:e_commerce_car/widgets/general_list_horizontal_card.dart';
import 'package:e_commerce_car/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get.dart';

class CarCompareListPage extends GetView<CarCompareListController> {
  const CarCompareListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List list = controller.
    // return GetBuilder<CarCompareListController>(
    //   init: CarCompareListController(),
    //   builder: (controller) {
    //     return Scaffold(
    //       backgroundColor: LightThemeColors.backgroundColor,
    //       body: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 20.w),
    //         child: Column(
    //           children: [                  Padding(
    //             padding: EdgeInsets.symmetric(vertical: 30.h),
    //             child: getSearch(
    //                 isSearch: false,
    //                 size: 13,
    //                 center: Text('Compare Cars',style: TextStyle(color: LightThemeColors.dividerColor),),
    //                 trailingIcon: AppIcons.star,
    //                 leadingIcon: AppIcons.backtrackIcon,
    //                 leadingOnTap: () => {},
    //                 leadingColor: LightThemeColors.dividerColor),
    //           ),
    //             Expanded(
    //               child: SingleChildScrollView(
    //                 child: Column(
    //                   children: [
    //                     GeneralListHorizontalCard(
    //                         scrollDirection: Axis.vertical,
    //                         list: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 0],
    //                         separator: 0,
    //                         separatorWidget: Padding(
    //                           padding: EdgeInsets.symmetric(vertical: 20.h),
    //                           child: Stack(
    //                             alignment: Alignment.center,
    //                             children: [
    //                               Container(
    //                                 width: double.infinity,
    //                                 height: 1.h,
    //                                 color: LightThemeColors.agentColor,
    //                               ),
    //                               CircleAvatar(
    //                                 radius: 15.h,
    //                                 backgroundColor: LightThemeColors.agentColor,
    //                                 child: Text(
    //                                   "Vs",
    //                                   style: TextStyle(
    //                                     fontSize: MyFonts.chipTextSize,
    //                                     fontWeight: FontWeight.bold,
    //                                     color: LightThemeColors.dividerColor,
    //                                   ),
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                         itemBuilder: controller.bulidItem,
    //                         showMoreText: null,
    //                         apiCallStatus: false,
    //                         physics: const NeverScrollableScrollPhysics(),
    //                         heightSizedBox: calculateListHeight(ListCar, 152, 20)),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       bottomNavigationBar: Container(
    //         width: double.infinity,
    //         height: 109.h,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20.r),
    //           color: LightThemeColors.scaffoldBackgroundColor,
    //         ),
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 20.w),
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 child: CustomOutlineButton(
    //                     onTap: () {},
    //                     width: 160,
    //                     height: 44,
    //                     text: '+ Add Cars'),
    //               ),
    //               SizedBox(
    //                 width: 10.w,
    //               ),
    //               Expanded(
    //                 child: CustomPrimaryButton(
    //                   width: 160,
    //                   height: 44,
    //                   text: "Continue",
    //                   onTap: () {},
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  return Container();
  }
}
