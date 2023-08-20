
import 'package:carstore/app/app_bottom_bar/controller/app_bottom_bar_controller.dart';
import 'package:carstore/app/auth/controller/login_controller.dart';
import 'package:carstore/app/auth/controller/login_info_controller.dart';
import 'package:carstore/app/auth/controller/login_location_controller.dart';
import 'package:carstore/app/auth/controller/login_verification_controller.dart';
import 'package:carstore/app/auto_part/controllers/auto_part_controller.dart';
import 'package:carstore/app/brand/controller/brand_controller.dart';
import 'package:carstore/app/cars/controllers/car_controller.dart';
import 'package:carstore/app/community/controllers/community_controller.dart';
import 'package:carstore/app/news/controllers/news_controller.dart';
import 'package:carstore/app/order/controllers/order_controller.dart';
import 'package:carstore/app/profile/controllers/profile_controller.dart';
import 'package:carstore/app/search/controllers/search_model_controller.dart';
import 'package:carstore/app/video/controllers/video_controller.dart';
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

    Get.lazyPut<CommunityController>(()=>CommunityController());


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