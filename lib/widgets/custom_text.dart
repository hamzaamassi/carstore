import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final AlignmentDirectional alignment;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isHtml;
  final int? maxLines;
  final double? height;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final TextStyle? style;

  const CustomText({
    super.key,
    required this.text,
    this.alignment = AlignmentDirectional.center,
    this.fontColor = LightThemeColors.primaryColor,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.isHtml = false,
    this.maxLines,
    this.height,
    this.textAlign = TextAlign.start,
    this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: alignment,
        padding: onTap != null ? EdgeInsets.all(4.r) : EdgeInsets.zero,
        child: isHtml
            ? HtmlWidget(text!)
            : Text(
                text!,
                textAlign: textAlign,
                style: TextStyle(
                  color: style?.color??fontColor,
                  fontSize: style?.fontSize??fontSize.sp,
                  fontWeight: style?.fontWeight??fontWeight,
                  height: style?.height??height,
                ) ,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
              ),
      ),
    );
  }
}
