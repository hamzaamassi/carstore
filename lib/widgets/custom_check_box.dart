import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final Color? borderColor;
  final String label;

  CustomCheckbox({
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: borderColor??LightThemeColors.dividerColor,
              fontSize: MyFonts.body2TextSize,
            ),
          ),
          SizedBox(width: 4.w),
          Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: value?LightThemeColors.primaryColor:Colors.transparent,
              border: Border.all(
                color: value?LightThemeColors.primaryColor:borderColor??LightThemeColors.dividerColor,
                width: 1.25,
              ),
            ),
            child: value
                ? Icon(
              Icons.check,
              size: 10.0,
              color: checkColor??LightThemeColors.backgroundColor,
            )
                : const Icon(
              Icons.check_box_outline_blank_rounded,
              size: 18,
              color: Colors.transparent,
            ),
          ),

        ],
      ),
    );
  }
}
