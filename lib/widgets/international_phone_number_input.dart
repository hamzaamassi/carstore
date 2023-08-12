import 'package:e_commerce_car/app/auth/controller/login_controller.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/core/config/translations/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:get/get.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>(); // Get the controller
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: Colors.grey, // Customize the line color here
            width: 1.0, // Customize the line thickness here
          ),
        )),
        child: InternationalPhoneNumberInput(
          selectorTextStyle: TextStyle(fontSize: MyFonts.body1TextSize),
          selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              leadingPadding: 8.w,
              showFlags: false),
          initialValue: PhoneNumber(isoCode: 'PS'),
          locale: LocalizationService.getCurrentLocal().languageCode,
          onInputChanged: (PhoneNumber phone) {
            controller.phoneNumberController.text = phone.phoneNumber ?? ''; // Update the controller value
          },
          onSaved: (phone) => {},
          inputBorder: InputBorder.none,
          hintText: '',
        ),
      ),
    );
  }
}
