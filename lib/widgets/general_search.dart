// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class getSearch extends StatelessWidget {
  final String? leadingIcon;
  final String? trailingIcon;
  final String? suffixIcon;
  final VoidCallback? suffixOnTap;
  final String? text;
  final Widget? center;
  final VoidCallback? leadingOnTap;
  final VoidCallback? trailingOnTap;
  final Widget? leadingData;
  final Widget? trailingData;
  final Color? leadingColor;
  final Color? trailingColor;
  final Color? textFieldColor;
  final Color? circleAvatarColor;
  final bool isSearch;
  final double? size;
  final void Function(String)? onChange;

  const getSearch({
    Key? key,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingData,
    this.trailingData,
    this.leadingOnTap,
    this.trailingOnTap,
    this.leadingColor,
    this.trailingColor,
    required this.isSearch,
     this.size,
    this.onChange,
    this.text,
    this.circleAvatarColor,
    this.suffixOnTap,
    this.suffixIcon,
    this.center,
    this.textFieldColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leadingIcon != null
            ? GestureDetector(
                onTap: leadingOnTap,
                child: Row(
                  children: [
                    Opacity(
                      opacity: .8,
                      child: leadingData ?? Container(),
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      leadingIcon!,
                      color: leadingColor ?? Colors.black,
                      height: size?.h??13.h,
                      width: size?.w??13.w,
                    ),
                    SizedBox(width: 15.w)
                  ],
                ),
              )
            : Container(),
        isSearch
            ? Expanded(
                child: Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: textFieldColor ?? LightThemeColors.backgroundColor,
                  ),
                  child: TextField(
                    onChanged: onChange,
                    style: const TextStyle(
                      color: LightThemeColors.dividerColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        color: LightThemeColors.dividerColor,
                        fontSize: 14,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(6.0.r),
                        child: SvgPicture.asset(
                          AppIcons.searchIcon,
                          color: LightThemeColors.dividerColor,
                          height: 20.h,
                          width: 20.w,
                        ),
                      ),
                      suffixIcon: suffixIcon != null
                          ? GestureDetector(
                              onTap: suffixOnTap,
                              child: Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: SvgPicture.asset(
                                  suffixIcon!,
                                  width: 8,
                                  height: 12,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
              )
            : center.isNull
                ? Text(
                    text ?? '',
                    style: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        color: LightThemeColors.iconColor),
                  )
                : center!,
        trailingIcon != null
            ? GestureDetector(
                onTap: trailingOnTap,
                child: Row(
                  children: [
                    SizedBox(width: 15.w),
                    trailingData ?? Container(),
                    SizedBox(width: 15.w),
                    CircleAvatar(
                      backgroundColor: circleAvatarColor,
                      radius: 16.r,
                      child: SvgPicture.asset(
                        trailingIcon!,
                        height: size?.h??14.h,
                        width: size?.w??14.w,
                        color: trailingColor ?? Colors.black,
                      ),
                    )
                  ],
                ),
              )
            : Container(),
      ],
    );
  }
}
