import 'package:carstore_car/app/app_bottom_bar/controller/app_bottom_bar_controller.dart';
import 'package:carstore_car/app/cars/view/car_page.dart';
import 'package:carstore_car/app/community/view/community_page.dart';
import 'package:carstore_car/app/home/view/home_page.dart';
import 'package:carstore_car/app/profile/view/profile_page.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/translations/strings_enum.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'bottom_app_bar_item.dart';

class AppBottomBar extends StatelessWidget {
  AppBottomBar({Key? key}) : super(key: key);
  final AppBottomBarController controller = Get.find();

  final List<Widget> _pages = <Widget>[
    HomePage(),
    CarPage(),
    CommunityPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldState,
        body: _pages[controller.selectedIndex.value],
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }

  buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 83.h,
      decoration: BoxDecoration(
          color: LightThemeColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomAppBarItem(
            image: AppIcons.homeIcon,
            title: Strings.home.tr,
            isSelected: controller.selectedIndex.value == 0,
            onPressed: () => controller.onTapNavFunction(0),
            imageSelected: AppIcons.homeIconSelected,
          ),
          BottomAppBarItem(
            image: AppIcons.carIcon,
            title: Strings.buyCar.tr,
            isSelected: controller.selectedIndex.value == 1,
            onPressed: () => controller.onTapNavFunction(1),
            imageSelected: AppIcons.carIconSelected,
          ),
          BottomAppBarItem(
            image: AppIcons.communityIcon,
            title: Strings.community.tr,
            isSelected: controller.selectedIndex.value == 2,
            onPressed: () => controller.onTapNavFunction(2),
            imageSelected: AppIcons.communityIconSelected,
          ),
          BottomAppBarItem(
            image: AppIcons.profileIcon,
            title: Strings.profile.tr,
            isSelected: controller.selectedIndex.value == 3,
            onPressed: () => controller.onTapNavFunction(3),
            imageSelected: AppIcons.profileIconSelected,
          ),
        ],
      ),
    );
  }
}
