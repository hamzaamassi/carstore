// ignore_for_file: deprecated_member_use

import 'package:e_commerce_car/binding/app_binding.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_theme.dart';
import 'package:e_commerce_car/core/config/translations/localization_service.dart';
import 'package:e_commerce_car/firebase_options.dart';
import 'package:e_commerce_car/local/my_shared_pref.dart';
import 'package:e_commerce_car/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await MySharedPref.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: 'Car',
          useInheritedMediaQuery: false,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          builder: (context, widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: SafeArea(
                  child: widget!,
                ),
              ),
            );
          },
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          initialBinding: AppBinding(),
          locale: MySharedPref.getCurrentLocal(),
          translations: LocalizationService(),
          color: const Color(0XFF1DB854),
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: LightThemeColors.primaryColor,
            backgroundColor: LightThemeColors.primaryColor,
            scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: LightThemeColors.appBarColor,
              elevation: 0,
            ),
            iconTheme: const IconThemeData(
              size: 13,
              color: LightThemeColors.appBarIconsColor,
            ),
          ),
        );
      },
    ),
  );
}
