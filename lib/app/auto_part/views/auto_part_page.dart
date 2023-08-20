import 'package:carstore/app/auto_part/controllers/auto_part_controller.dart';
import 'package:carstore/app/auto_part/models/auto_part_list.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/calculate_list_height.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:carstore/widgets/item_add_cart_card.dart';
import 'package:carstore/widgets/item_auto_part_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AutoPartPage extends GetView<AutoPartController> {
  const AutoPartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AutoPartController());
    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            getSearch(
              isSearch: false,
              size: 12,
              leadingIcon: AppIcons.backtrackIcon,
              leadingOnTap: () => {},
              leadingColor: LightThemeColors.dividerColor,
              trailingIcon: AppIcons.backtrackIcon,
              trailingColor: LightThemeColors.primaryColor,
              trailingOnTap: () => {},
              text: 'Auto parts',
              circleAvatarColor: LightThemeColors.scaffoldBackgroundColor,
            ),
            SizedBox(height: 24.h),
            const getSearch(
              isSearch: true,
              size: 13,
              suffixIcon: null,
              textFieldColor: LightThemeColors.scaffoldBackgroundColor,
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GeneralListHorizontalCard(
                        list: controller.item,
                        showMoreText: null,
                        itemBuilder: (context, index) {
                          return controller.bulidSecondItemList(context, index);
                        },
                        separator: 34,
                        heightSizedBox: 77),
                    SizedBox(height: 28.h),
                    GeneralListHorizontalCard(
                      title: 'For You',
                      list: AutoPartList,
                      itemBuilder: (context, index) {
                        final list = AutoPartList[index];
                        return ItemAddCartCard(autoPart: list);
                      },
                      separator: 15,
                      heightSizedBox: 225,
                    ),
                    SizedBox(height: 28.h),
                    GeneralListHorizontalCard(
                        list: AutoPartList,
                        title: 'Popular',
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final list = AutoPartList[index];
                          return ItemAutoPartCard(autoPart: list);
                        },
                        separator: 20,
                        heightSizedBox:
                            calculateListHeight(AutoPartList, 93, 20),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
