import 'package:carstore/app/cars/model/key_specs_model.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AutoPartController extends GetxController {
  List<KeySpecsModel> item = [
    KeySpecsModel(name: "Category", image: AppIcons.enginePower),
    KeySpecsModel(name: "Wheels", image: AppIcons.maxTorque),
    KeySpecsModel(name: "Light", image: AppIcons.acceleration),
    KeySpecsModel(name: "Interior", image: AppIcons.acceleration),
  ].obs;

  Widget bulidSecondItemList(context, index) => Column(
    children: [
      Container(
            width: 54.w,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: LightThemeColors.scaffoldBackgroundColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(18.r),
              child: SvgPicture.asset(
                "${item[index].image}",
                height: 18.h,
                width: 18.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
      SizedBox(
        height: 4.h,
      ),
      Text(
        "${item[index].name}",
        style: TextStyle(fontSize: MyFonts.body2TextSize,color: LightThemeColors.iconColor),
      ),
    ],
  );
}
