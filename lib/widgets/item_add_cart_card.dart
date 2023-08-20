// ignore_for_file: deprecated_member_use

import 'package:carstore/app/auto_part/models/auto_part.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemAddCartCard extends StatelessWidget {
  const ItemAddCartCard({Key? key, required this.autoPart}) : super(key: key);

  final AutoPart autoPart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => {},
      // Get.toNamed(Routes.carDetails, arguments: CarDetailsPage(car: car)),
      child: Container(
        width: 150,
        height: 225,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: LightThemeColors.scaffoldBackgroundColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 15,
              right: 15,
              left: 15,
              child: Image.asset(
                autoPart.image!,
                width: 120.w,
                height: 80.h,
              ),
            ),
            Positioned(
              left: 15,
              top: 113,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    autoPart.name ?? '',
                    style: TextStyle(
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.iconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Opacity(
                    opacity: .8,
                    child: Text(
                      '${autoPart.opacityTitle}',
                      style: TextStyle(
                        fontSize: MyFonts.chipTextSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${autoPart.price}',
                    style: TextStyle(
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: CircleAvatar(
                      backgroundColor: LightThemeColors.backgroundColor,
                      radius: 12.r,
                      child: SvgPicture.asset(
                        AppIcons.star,
                        height: 14.h,
                        width: 14.w,
                        color: LightThemeColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: GestureDetector(
                onTap: () => autoPart.favorite = !autoPart.favorite!,
                child: autoPart.favorite!
                    ? SvgPicture.asset(AppIcons.selectedfavorite,
                        width: 14.w, height: 14.h)
                    : SvgPicture.asset(AppIcons.favorite,
                        width: 14.w, height: 14.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
