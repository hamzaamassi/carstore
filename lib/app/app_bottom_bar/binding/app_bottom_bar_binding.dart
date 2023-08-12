
import 'package:get/get.dart';

import '../controller/app_bottom_bar_controller.dart';

class AppBottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppBottomBarController>(AppBottomBarController());

    // Get.lazyPut<ProductsController>(() => ProductsController());

  }
}
