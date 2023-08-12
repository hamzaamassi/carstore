
import 'package:e_commerce_car/app/app_bottom_bar/controller/app_bottom_bar_controller.dart';
import 'package:e_commerce_car/app/auth/controller/login_controller.dart';
import 'package:e_commerce_car/app/auth/controller/login_info_controller.dart';
import 'package:e_commerce_car/app/auth/controller/login_location_controller.dart';
import 'package:e_commerce_car/app/auth/controller/login_verification_controller.dart';
import 'package:e_commerce_car/app/auto_part/controllers/auto_part_controller.dart';
import 'package:e_commerce_car/app/brand/controller/brand_controller.dart';
import 'package:e_commerce_car/app/cars/controllers/car_compare_controller.dart';
import 'package:e_commerce_car/app/cars/controllers/car_compare_list_controller.dart';
import 'package:e_commerce_car/app/cars/controllers/car_controller.dart';
import 'package:e_commerce_car/app/cars/controllers/car_details_controller.dart';
import 'package:e_commerce_car/app/cars/controllers/car_info_controller.dart';
import 'package:e_commerce_car/app/community/controllers/community_controller.dart';
import 'package:e_commerce_car/app/home/controllers/home_controller.dart';
import 'package:e_commerce_car/app/news/controllers/news_controller.dart';
import 'package:e_commerce_car/app/order/controllers/order_controller.dart';
import 'package:e_commerce_car/app/profile/controllers/profile_controller.dart';
import 'package:e_commerce_car/app/search/controllers/search_model_controller.dart';
import 'package:e_commerce_car/app/video/controllers/video_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppBottomBarController>(()=>AppBottomBarController());

    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginVerificationController>(() => LoginVerificationController());
    Get.lazyPut<LoginInfoController>(() => LoginInfoController());
    Get.lazyPut<LoginLocationController>(() => LoginLocationController());

    Get.lazyPut<BrandController>(()=>BrandController());

    Get.lazyPut<CarController>(()=>CarController());
    Get.lazyPut<CarDetailsController>(()=>CarDetailsController());
    Get.lazyPut<CarInfoController>(()=>CarInfoController());
    Get.lazyPut<CarsCompareController>(()=>CarsCompareController());
    Get.lazyPut<CarCompareListController>(()=>CarCompareListController());

    Get.lazyPut<CommunityController>(()=>CommunityController());

    Get.lazyPut<HomeController>(()=>HomeController());

    Get.lazyPut<NewsController>(()=>NewsController());

    Get.lazyPut<ProfileController>(()=>ProfileController());

    Get.lazyPut<SearchModelController>(()=>SearchModelController());

    Get.lazyPut<VideoController>(()=>VideoController());

    Get.lazyPut<OrderController>(()=>OrderController());

    Get.lazyPut<AutoPartController>(()=>AutoPartController());



    // Get.lazyPut<AppBottomBarController>(()=>AppBottomBarController());
    // Get.lazyPut<AppBottomBarController>(()=>AppBottomBarController());

  }
}