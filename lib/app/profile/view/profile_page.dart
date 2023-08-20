// ignore_for_file: deprecated_member_use

import 'package:carstore/app/profile/controllers/profile_controller.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/core/config/translations/strings_enum.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/custom_list_view.dart';
import 'package:carstore/widgets/custom_outline_button.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
        backgroundColor: LightThemeColors.scaffoldBackgroundColor,
        bottomNavigationBar: buildBottomNavigation(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              getSearch(
                isSearch: false,
                leadingIcon: AppIcons.backtrackIcon,
                leadingOnTap: () => {},
                trailingIcon: AppIcons.setting,
                trailingColor: LightThemeColors.dividerColor,
                circleAvatarColor: LightThemeColors.backgroundColor,
                trailingData: CircleAvatar(
                  backgroundColor: LightThemeColors.backgroundColor,
                  radius: 16.h,
                  child: SvgPicture.asset(
                      width: 14.w,
                      height: 14.h,
                      AppIcons.chat, // Replace with your close icon path
                      color: LightThemeColors.dividerColor),
                ),
                size: 14,
              ),
              SizedBox(height: 30.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundImage: const NetworkImage(
                            "https://images.pexels.com/photos/1484806/pexels-photo-1484806.jpeg?auto=compress&cs=tinysrgb&w=800"),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sebastian",
                            style: TextStyle(
                              fontSize: MyFonts.sectionListTitle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            "BMW 3 Series/7 Series owner",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomOutlineButton(onTap: () => {}),
                      SizedBox(
                        width: 33.w,
                      ),
                      CustomListView(
                        itemBuilder: controller.buildFirstListItemsForProfile,
                        height: 60.h,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: SizedBox(
                          width: 20.w,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget buildBottomNavigation(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity.w,
        decoration: BoxDecoration(
            color: LightThemeColors.cardColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Opacity(
                opacity: .8,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.category,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Common Functions",
                        style: TextStyle(fontSize: MyFonts.headline6TextSize))
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              GeneralListHorizontalCard(
                heightSizedBox: 76,
                showMoreText: null,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: controller.buildSecondListItemsForProfile,
                separator: 10,
                list: controller.commonFunctionsModel,
              ),
              SizedBox(height: 28.h),
              Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.iconCar,
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "My cars",
                          style: TextStyle(
                            fontSize: MyFonts.headline6TextSize,
                            color: LightThemeColors.darkColor,
                          ),

                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 30.h,
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        "Owned/Driven",
                        style: TextStyle(
                          fontSize: MyFonts.body2TextSize,
                          color: LightThemeColors.iconColor,
                        ),

                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity.w,
                      height: 1.h,
                      color: LightThemeColors.accentColor),
                ],
              ),
              SizedBox(height: 23.h),
              ListTile(
                leading: Text(
                  "Like List",
                  style: TextStyle(
                    fontSize: MyFonts.body2TextSize,
                    color: LightThemeColors.iconColor,
                  ),

                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 30.h,
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.other,
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Others",
                          style: TextStyle(
                            fontSize: MyFonts.body2TextSize,
                            color: LightThemeColors.iconColor,
                          ),

                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 30.h,
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        "Feedback",
                        style: TextStyle(
                              fontSize: MyFonts.body2TextSize,
                              color: LightThemeColors.iconColor,
                            ),
                      ),
                    ),
                  ),
                  Container(
                      width: double.infinity.w,
                      height: 1.h,
                      color: LightThemeColors.accentColor),
                ],
              ),
              TextButton(
                  onPressed:controller.logout,
                  child: Text(
                    Strings.logOut.tr,
                    style: TextStyle(
                        color: LightThemeColors.primaryColor,
                        fontSize: MyFonts.body2TextSize),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
