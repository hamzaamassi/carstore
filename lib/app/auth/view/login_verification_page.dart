import 'package:e_commerce_car/app/auth/controller/login_controller.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/core/config/translations/strings_enum.dart';
import 'package:e_commerce_car/app/auth/controller/login_verification_controller.dart';
import 'package:e_commerce_car/routes/app_pages.dart';
import 'package:e_commerce_car/widgets/custom_appbar.dart';
import 'package:e_commerce_car/widgets/custom_primary_button.dart';
import 'package:e_commerce_car/widgets/pin_code_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginVerificationPage extends GetView<LoginController> {
  const LoginVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: LightThemeColors.appBarColor,
      appBar: getAppBar(context, showBackIcon: true),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Strings.verification.tr,
                style: TextStyle(
                    fontSize: MyFonts.headline4TextSize,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 9.h),
              Opacity(
                opacity: .7,
                child: Text(
                  Strings.verificationDesc.tr,
                  style: TextStyle(fontSize: MyFonts.body2TextSize),
                ),
              ),
              SizedBox(height: 68.h),
              const PinCodeOTP(),
              SizedBox(height: 70.h),
              CustomPrimaryButton(
                text: Strings.continueButton.tr,
                onTap: controller.signInWithPhoneNumber,
              ),
              SizedBox(height: 28.h),
              Text(
                Strings.resendIn.tr,
                style: TextStyle(
                    color: LightThemeColors.primaryColor,
                    fontSize: MyFonts.body2TextSize),
              )
            ],
          ),
        ),
      ),
    );
  }
}
