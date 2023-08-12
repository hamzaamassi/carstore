import 'package:carstore_car/app/order/controllers/order_controller.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/widgets/calculate_list_height.dart';
import 'package:carstore_car/widgets/general_list_horizontal_card.dart';
import 'package:carstore_car/widgets/general_search.dart';
import 'package:carstore_car/widgets/order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {


    Get.put(OrderController());

    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      body: Obx(
        () {
          bool isPay = controller.isPay.value;
          return Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: getSearch(
                      leadingIcon: AppIcons.backtrackIcon,
                      trailingIcon: AppIcons.trueIcon,
                      trailingColor: LightThemeColors.dividerColor,
                      leadingColor: LightThemeColors.dividerColor,
                      circleAvatarColor: Colors.transparent,
                      isSearch: false,
                      size: 13,
                      text: 'My Order',
                      leadingOnTap: () => {},
                      trailingOnTap: () => {},
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: GeneralListHorizontalCard(
                                physics: const NeverScrollableScrollPhysics(),
                                showMoreText: '',
                                title: '${controller.order.length} items selected',
                                list: controller.order,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  final order = controller.order[index];
                                  return OrderItemCard(order: order);
                                },
                                separator: 20,
                                heightSizedBox:
                                    calculateListHeight(controller.order, 95, 20)),
                          ),
                          SizedBox(height: 30.h),
                          controller.buildContainer(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              if (isPay) controller.buildDisplayContainer(),
            ],
          );
        },
      ),
    );
  }
}
