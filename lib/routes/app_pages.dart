// ignore_for_file: constant_identifier_names

import 'package:carstore_car/app/app_bottom_bar/view/app_bottom_bar.dart';
import 'package:carstore_car/app/auth/view/login_info_page.dart';
import 'package:carstore_car/app/auth/view/login_location_page.dart';
import 'package:carstore_car/app/auth/view/login_page.dart';
import 'package:carstore_car/app/auth/view/login_verification_page.dart';
import 'package:carstore_car/app/auto_part/views/auto_part_page.dart';
import 'package:carstore_car/app/brand/view/brand_details_page.dart';
import 'package:carstore_car/app/brand/view/brand_page.dart';
import 'package:carstore_car/app/brand/view/barnd_search_page.dart';
import 'package:carstore_car/app/cars/view/car_compare__list_page.dart';
import 'package:carstore_car/app/cars/view/car_compare_page.dart';
import 'package:carstore_car/app/cars/view/car_details_page.dart';
import 'package:carstore_car/app/cars/view/car_info_page.dart';
import 'package:carstore_car/app/cars/view/car_page.dart';
import 'package:carstore_car/app/community/view/community_page.dart';
import 'package:carstore_car/app/home/view/home_page.dart';
import 'package:carstore_car/app/news/view/news_details_page.dart';
import 'package:carstore_car/app/news/view/news_review_page.dart';
import 'package:carstore_car/app/order/views/order_page.dart';
import 'package:carstore_car/app/search/views/search_model_page.dart';
import 'package:carstore_car/app/search/views/search_page.dart';
import 'package:carstore_car/app/video/views/video_page.dart';
import 'package:carstore_car/app/video/views/videos_review_page.dart';
import 'package:carstore_car/binding/app_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.appBottomBar;

  static final routes = [
    GetPage(
      name: _Paths.appBottomBar,
      page: () => AppBottomBar(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.loginVerification,
      page: () => const LoginVerificationPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.loginInfo,
      page: () => const LoginInfoPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.loginLocation,
      page: () => const LoginLocationPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.car,
      page: () => const CarPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.community,
      page: () => const CommunityPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.carDetails,
      page: () => CarDetailsPage(),
      // page: () {
      //   CarDetailsPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.brand,
      page: () => BrandPage(),

      // page: () {
      //   BrandPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.brandDetails,
      page: () => BrandDetailsPage(),

      // page: () {
      //   BrandDetailsPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.newsDetails,
      page: () => NewsDetailsPage(),

      // page: () {
      //   NewsDetailsPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.newsReview,
      page: () => NewsReviewPage(),

      // page: () {
      //   NewsReviewPage page = Get.arguments;
      //   return page;
      // },
    ),
    GetPage(
      name: _Paths.video,
      page: () => VideoPage(),
      // page: () {
      //   VideoPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.searchModel,
      page: () => SearchModelPage(),

      // page: () {
      //   SearchModelPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.videosReview,
      page: () => VideoReviewPage(),
      // page: () {
      //   VideoReviewPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.searchBrand,
      page: () => BrandSearchPage(),
      // page: () {
      //   SearchBrandPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.search,
      page: () => SearchPage(),
      // page: () {
      //   SearchPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.carInfo,
      page: () => CarInfoPage(),
      // page: () {
      //   CarInfoPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.carCompare,
      page: () => CarsComparePage(),
      // page: () {
      //   CarsComparePage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.carList,
      page: () => CarCompareListPage(),
      // page: () {
      //   CarCompareListPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.order,
      page: () => OrderPage(),
      // page: () {
      //   CarCompareListPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
    GetPage(
      name: _Paths.autoPart,
      page: () => AutoPartPage(),
      // page: () {
      //   AutoPartPage page = Get.arguments;
      //   return page;
      // },
      binding: AppBinding(),
    ),
  ];
}
