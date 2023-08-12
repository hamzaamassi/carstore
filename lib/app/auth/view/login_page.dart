import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/core/config/translations/strings_enum.dart';
import 'package:e_commerce_car/app/auth/controller/login_controller.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/custom_appbar.dart';
import 'package:e_commerce_car/widgets/custom_primary_button.dart';
import 'package:e_commerce_car/widgets/international_phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
        backgroundColor: LightThemeColors.backgroundColor,
        appBar: getAppBar(context,
            showBackIcon: true, leadingIcon: AppIcons.closeIcon),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 145.h),
                const PhoneNumberInput(),
                SizedBox(height: 61.h),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.trueIcon),
                    SizedBox(width: 6.w),
                    Text(
                      Strings.policyLogin.tr,
                      style: TextStyle(
                          color: LightThemeColors.borderColor,
                          fontSize: MyFonts.headline6TextSize),
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        Strings.termsPolicy.tr,
                        style: TextStyle(
                            color: LightThemeColors.primaryColor,
                            fontSize: MyFonts.headline6TextSize),
                      ),
                    ),
                    Text(
                      Strings.and.tr,
                      style: TextStyle(
                          color: LightThemeColors.borderColor,
                          fontSize: MyFonts.headline6TextSize),
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        Strings.dataPolicy.tr,
                        style: TextStyle(
                            color: LightThemeColors.primaryColor,
                            fontSize: MyFonts.headline6TextSize),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 75.h),
                CustomPrimaryButton(
                  text: Strings.continueButton.tr,
                  onTap: controller.verifyPhoneNumber,
                ),
                SizedBox(height: 187.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 31.w,
                      height: 2.h,
                      color: LightThemeColors.dividerColor,
                    ),
                    SizedBox(width: 5.6.w),
                    Text(
                      Strings.loginWith.tr,
                      style: TextStyle(
                          fontSize: MyFonts.body2TextSize,
                          color: LightThemeColors.dividerColor),
                    ),
                    SizedBox(width: 5.6.w),
                    Container(
                      width: 31.w,
                      height: 2.h,
                      color: LightThemeColors.dividerColor,
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: ()=>{controller.signInWithFacebook(context)},
                      child: SvgPicture.asset(AppIcons.facebookIcon),
                    ),
                    SizedBox(width: 30.w),
                    GestureDetector(
                      onTap: ()=>{controller.signInWithGoogle(context)},
                      child: SvgPicture.asset(AppIcons.googleIcon),
                    ),
                    SizedBox(width: 30.w),
                    GestureDetector(
                      onTap: ()=>{controller.signInWithTwitter(context)},
                      child: SvgPicture.asset(AppIcons.twitterIcon),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
