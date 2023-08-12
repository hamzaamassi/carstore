import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/core/config/translations/strings_enum.dart';
import 'package:carstore_car/app/auth/controller/login_info_controller.dart';
import 'package:carstore_car/routes/app_pages.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/widgets/custom_appbar.dart';
import 'package:carstore_car/widgets/custom_primary_button.dart';
import 'package:carstore_car/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginInfoPage extends GetView<LoginInfoController> {
  const LoginInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.backgroundColor,
      appBar: getAppBar(context, showBackIcon: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 57.9.h),
              Opacity(
                opacity: .5,
                child: Text(
                  Strings.fullName.tr,
                  style: TextStyle(fontSize: MyFonts.body2TextSize),
                ),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                  // controller: controller.fullNameController,
                  textInputAction: TextInputAction.next,
                  suffixIcon: AppIcons.closeClear),
              SizedBox(height: 28.h),
              Opacity(
                opacity: .5,
                child: Text(
                  Strings.email.tr,
                  style: TextStyle(fontSize: MyFonts.body2TextSize),
                ),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                  // controller: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  suffixIcon: AppIcons.closeClear),
              SizedBox(height: 18.h),
              Opacity(
                opacity: .5,
                child: Text(
                  Strings.emailDesc.tr,
                  style: TextStyle(fontSize: MyFonts.body2TextSize),
                ),
              ),
              SizedBox(height: 28.h),
              Opacity(
                opacity: .5,
                child: Text(
                  Strings.password.tr,
                  style: TextStyle(fontSize: MyFonts.body2TextSize),
                ),
              ),
              SizedBox(height: 16.h),
              const CustomTextFormField(
                obscureText: true,
                // controller: controller.passwordController,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 28.h),
              Opacity(
                opacity: .5,
                child: Text(
                  Strings.confirmPassword.tr,
                  style: TextStyle(fontSize: MyFonts.body2TextSize),
                ),
              ),
              SizedBox(height: 16.h),
              const CustomTextFormField(
                obscureText: true,
                // controller: controller.passwordController,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 70.h),
              CustomPrimaryButton(
                text: Strings.continueButton.tr,
                onTap: () => {Get.offAndToNamed(Routes.loginLocation)},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
