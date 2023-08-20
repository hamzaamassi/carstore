import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/routes/app_pages.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Widget buildFirstListItemsForProfile(context, index) => Column(
        children: [
          Text(
            followerInfoModel[index].num.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: MyFonts.body2TextSize,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 2.h),
          Opacity(
            opacity: .6,
            child: Text(followerInfoModel[index].text.toString(),
                style: TextStyle(fontSize: MyFonts.headline6TextSize)),
          )
        ],
      );
  List<FollowerInfoModel> followerInfoModel = [
    FollowerInfoModel(num: 47, text: "Following"),
    FollowerInfoModel(num: 8673, text: "Follower"),
    FollowerInfoModel(num: 67, text: "Post"),
  ];

  Widget buildSecondListItemsForProfile(context, index) => Container(
        height: 74.h,
        width: 74.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: LightThemeColors.scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              commonFunctionsModel[index].image.toString(),
              height: 20.h,
              width: 20.w,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              textAlign: TextAlign.center,

              commonFunctionsModel[index].text.toString(),
              // style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              //     fontSize: 9.sp,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.black),
            )
          ],
        ),
      );
  List<CommonFunctionsModel> commonFunctionsModel = [
    CommonFunctionsModel(image: AppIcons.order, text: "My order"),
    CommonFunctionsModel(image: AppIcons.maintain, text: "Maintain"),
    CommonFunctionsModel(image: AppIcons.autoParts, text: "Auto parts"),
    CommonFunctionsModel(image: AppIcons.driver, text: "Driving skills"),
  ].obs;
void logout(){
  FirebaseAuth.instance.signOut();
  Get.offAndToNamed(Routes.login);
}
}

class CommonFunctionsModel {
  String? text;
  String? image;

  CommonFunctionsModel({this.text, this.image});
}

class FollowerInfoModel {
  String? text;
  int? num;

  FollowerInfoModel({this.text, this.num});
}
