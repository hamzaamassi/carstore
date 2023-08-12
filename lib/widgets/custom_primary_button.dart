import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final int? width;
  final int? height;
  final double? size;
  final Color? color;
  final VoidCallback onTap;
  final bool isLoading;
  final bool isDisable;

  const CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isDisable = false,
    this.width,
    this.height,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable || isLoading ? null : onTap,
      child: SizedBox(
        width: width?.w ?? double.infinity.w,
        height: height?.h ?? 50.h,
        child: Container(
          decoration: BoxDecoration(
              color: LightThemeColors.primaryColor,
              borderRadius: BorderRadius.circular(25.r)),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: LightThemeColors.backgroundColor,
                  )
                : Text(
                    text.tr,
                    style: TextStyle(
                        color: color??LightThemeColors.backgroundColor, fontSize: size??MyFonts.body1TextSize),
                  ),
          ),
        ),
      ),
    );
  }
}
