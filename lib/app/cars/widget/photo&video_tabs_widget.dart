import 'package:carstore_car/app/cars/controllers/car_controller.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/widgets/general_list_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhotoAndVideoTabsWidget extends GetView<CarController> {
  const PhotoAndVideoTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List list = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20
    ].obs;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          GeneralListGridCard(
              title: '2020 Cayman 2T',
              showMoreText: '',
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              crossAxisSpacing: 5,
              mainAxisExtent: 109,
              style: TextStyle(
                  color: LightThemeColors.iconColor,
                  fontSize: MyFonts.headline6TextSize),
              list: list,
              itemBuilder: _photo,
              heightSizedBox: 145),
          SizedBox(height: 28.h),
          GeneralListGridCard(
              title: '2020 Cayman 2T',
              showMoreText: '',
              mainAxisSpacing: 5.w,
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              crossAxisSpacing: 5.h,
              mainAxisExtent: 109.w,
              style: TextStyle(
                  color: LightThemeColors.iconColor,
                  fontSize: MyFonts.headline6TextSize),
              list: list,
              itemBuilder: _video,
              heightSizedBox: 145)
        ],
      ),
    );
  }

  Widget _photo(context, index) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Image.network(
          "https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*",
          height: 72.h,
          width: 108.w,
          fit: BoxFit.cover,
        ));
  }

  Widget _video(context, index) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Image.network(
          "https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*",
          height: 72.h,
          width: 108.w,
          fit: BoxFit.cover,
        ));
  }
}
