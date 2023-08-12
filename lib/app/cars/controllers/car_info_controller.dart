import 'package:carstore_car/app/cars/widget/photo&video_tabs_widget.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarInfoController extends GetxController {
  List<int> myColors = [
    0Xfff00AC5E,
    0XfffF6C604,
    0XfffFF3131,
    0Xfff424243,
    0Xfff006DEA
  ].obs;
  int index = 0;

  List<String> choices = [
    "Photos",
    "Videos",
  ];

  void changeValueOfIndex(value) {
    index = value;
    update();
  }

  void changeValueOfIndexindexChoices(value) {
    update();
  }

  double rotationX = 0.0;
  double rotationY = 0.0;

  void changeValueOfTransform(rotationX, rotationY) {
    this.rotationX += rotationX;
    this.rotationY -= rotationY;
    update();
  }

  Widget bulidItems(context, index) => Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
              onTap: () {
                changeValueOfIndex(index);
              },
              child: CircleAvatar(
                radius: 10.h,
                backgroundColor: Color(myColors[index]),
              )),
          this.index == index
              ? CircleAvatar(
                  radius: 15.h,
                  backgroundColor: Color(myColors[index]).withOpacity(0.55),
                )
              : Container(),
        ],
      );

  Widget bulidSecondItemList() => Container(
    height: 543,
    decoration: BoxDecoration(
      color: LightThemeColors.backgroundColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(15.r),
        topLeft: Radius.circular(15.r),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: DefaultTabController(
        length: 2, // Change this to the number of tabs you want
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: const TabBar(
                isScrollable: true,
                labelColor: LightThemeColors.primaryColor,
                labelStyle: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold),
                unselectedLabelColor: LightThemeColors.dividerColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                indicatorColor: LightThemeColors.primaryColor,
                tabs: [
                  Tab(text: 'Photots'),
                  Tab(text: 'Videos'),
                  // Add more tabs as needed
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  PhotoAndVideoTabsWidget(),
                  PhotoAndVideoTabsWidget(),
                ],
              ),
            ),
            CustomPrimaryButton(
              onTap: () {},
              text: 'Get Offers from Dealer',
            ),
            SizedBox(height: 30.h)
          ],
        ),
      ),
    ),
  );
}
