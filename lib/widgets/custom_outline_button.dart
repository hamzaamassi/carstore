import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final int? width;
  final int? height;

  const CustomOutlineButton(
      {super.key, required this.onTap, this.text, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w ?? 70.w,
      height: height?.h ?? 24.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: LightThemeColors.primaryColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ), // Customize the border radius
        ),
        onPressed: onTap,
        child: Text(text ?? "+ Follow",
            style: TextStyle(
                color: LightThemeColors.primaryColor,
                fontSize: MyFonts.chipTextSize)),
      ),
    );
  }
}
