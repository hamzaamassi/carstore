import 'package:carstore_car/app/auth/controller/login_controller.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeOTP extends StatelessWidget {
  const PinCodeOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = LoginController();
    return PinCodeTextField(
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.go,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.r),
          fieldHeight: 35.h,
          fieldWidth: 35.w,
          activeFillColor: LightThemeColors.accentColor,
          inactiveColor: LightThemeColors.accentColor,
          borderWidth: 0,
          selectedBorderWidth: 0,
          activeBorderWidth: 0,
          disabledBorderWidth: 0,
          selectedFillColor: LightThemeColors.accentColor,
          inactiveBorderWidth: 0,
          inactiveFillColor: LightThemeColors.accentColor,
          errorBorderColor: LightThemeColors.accentColor,
          errorBorderWidth: 0,
          activeColor: LightThemeColors.accentColor,
          disabledColor: LightThemeColors.accentColor,
          selectedColor: LightThemeColors.accentColor,
          fieldOuterPadding: EdgeInsets.symmetric(horizontal: 10.w)),
      enableActiveFill: true,
      controller: controller.smsCodeController,
      animationDuration: const Duration(milliseconds: 300),
      onChanged: (value) {
        controller.smsCodeController.text = value;
      },
    );
  }
}
