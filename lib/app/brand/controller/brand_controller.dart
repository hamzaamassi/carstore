import 'package:carstore_car/app/brand/model/brand.dart';
import 'package:carstore_car/app/brand/model/brand_list_response.dart';
import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/cars/model/car_list_response.dart';
import 'package:carstore_car/routes/app_pages.dart';
import 'package:carstore_car/services/base_client.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  RxList<Brand> brands = RxList();
  RxList<Car> cars = RxList();
  RxList<Car> brandCar = RxList();
  RxString brandName = ''.obs;
  RxInt brandId = 0.obs;
  bool isLoading = true;
  RxInt index = 0.obs;
  RxString name = ''.obs;


@override
  void onReady() {
  loadBrandCars();
    super.onReady();
  }
  void loadBrandCars() async {
    try {
      isLoading = true;
      final url = '${Constants.brandDetails}$brandId';
      await BaseClient.get(
        url,
        onSuccess: (response) {
          CarsResponse loadedBrandCars =
              carsResponseFromJson(response.toString());
          brandCar.value = loadedBrandCars.cars;
          Get.toNamed(Routes.brandDetails);
          isLoading = false;
          update();
        },
        onError: (error) {
          BaseClient.handleApiError(error);
          error.printInfo();
        },
      );
      await BaseClient.get(
        Constants.cars,
        onSuccess: (response) {
          CarsResponse loadedCars = carsResponseFromJson(response.toString());
          cars.value = loadedCars.cars;
          isLoading = false;
          update();
        },
        onError: (error) {
          BaseClient.handleApiError(error);
          error.printInfo();
        },
      );
      await BaseClient.get(
        Constants.brands,
        onSuccess: (response) {
          BrandsResponse loadedBrands =
          brandsResponseFromJson(response.toString());
          brands.value = loadedBrands.brands;
          isLoading = false;
          update();
        },
        onError: (error) {
          BaseClient.handleApiError(error);
          error.printInfo();
        },
      );


    } catch (e) {
      e.printInfo();
    }
  }

}
