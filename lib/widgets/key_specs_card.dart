import 'package:e_commerce_car/app/cars/model/key_specs_model.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/widgets/car_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class KeySpecsCard extends GetView<CarDetailsCard> {
  const KeySpecsCard({Key? key, required this.keySpecs}) : super(key: key);
final KeySpecsModel keySpecs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: LightThemeColors.cardColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "${keySpecs.image}",
              height: 30.h,
              width: 30.w,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text("${keySpecs.name}",
                style: TextStyle(fontSize: MyFonts.headline6TextSize)),
            SizedBox(
              height: 5.h,
            ),
            Text("${keySpecs.details}",
                style: TextStyle(fontSize: MyFonts.chipTextSize)),
          ],
        ),
      ),
    );
  }
}
