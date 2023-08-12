import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionListTitle extends StatelessWidget {
  const SectionListTitle({
    Key? key,
    this.title,
    this.showMoreText,
    this.onClickMoreText,
    this.style,
  }) : super(key: key);

  final String? title;
  final String? showMoreText;
  final VoidCallback? onClickMoreText;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: true,
          child: CustomText(
            text: title ?? '',
            fontWeight: FontWeight.bold,
            fontSize: MyFonts.sectionListTitle,
            fontColor: LightThemeColors.iconColor,
            alignment: AlignmentDirectional.centerStart,
            style: style,
          ),
        ),
        Visibility(
          visible: true,
          child: TextButton(
            onPressed: onClickMoreText,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            child: Row(
              children: [
                CustomText(
                  text: showMoreText!,
                  alignment: AlignmentDirectional.centerStart,
                  fontColor: LightThemeColors.primaryColor,
                ),
                showMoreText!.isNotEmpty
                    ? Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: LightThemeColors.primaryColor,
                        size: 14.r,
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
