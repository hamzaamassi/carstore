import 'package:carstore_car/app/auth/controller/login_controller.dart';
import 'package:carstore_car/app/auth/controller/login_info_controller.dart';
import 'package:carstore_car/app/auth/controller/login_location_controller.dart';
import 'package:carstore_car/app/auth/controller/login_verification_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<LoginController>(LoginController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginVerificationController>(() => LoginVerificationController());
    Get.lazyPut<LoginInfoController>(() => LoginInfoController());
    Get.lazyPut<LoginLocationController>(() => LoginLocationController());
  }
}
