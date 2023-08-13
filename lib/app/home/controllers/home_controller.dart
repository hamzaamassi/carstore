import 'package:carstore_car/app/brand/model/brand.dart';
import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/home/model/home_response.dart';
import 'package:carstore_car/services/base_client.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<SliderModel> sliderList = RxList();
  RxList<Brand> brandList = RxList();
  RxList<Car> carList = RxList();
  bool isLoading = true;

  @override
  void onReady() {
    loadHome();
    super.onReady();
  }

  void loadHome() async {
    try {
      isLoading = true;
      await BaseClient.get(
        Constants.home,
        onSuccess: (response) {
          HomeResponse loadedHome = homeResponseFromJson(response.toString());
          sliderList.value = loadedHome.data.sliders;
          brandList.value = loadedHome.data.brands;
          carList.value = loadedHome.data.cars;
          isLoading = false;
          update();
        },
        onError: (error) {
          BaseClient.handleApiError(error);
          error.printInfo();
          update();
        },
      );
    } catch (e) {
      e.printInfo();
    }
    update();
  }
}
