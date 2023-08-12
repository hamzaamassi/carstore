import 'package:carstore_car/app/brand/model/beand_car_response.dart';
import 'package:carstore_car/app/brand/model/brand.dart';
import 'package:carstore_car/app/brand/model/brand_list_response.dart';
import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/cars/model/car_list_response.dart';
import 'package:carstore_car/app/services/base_client.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  RxList<Brand> brands = RxList();
  RxList<Car> cars = RxList();
  RxList<BrandCar> brandCar = RxList();

  final RxList<Brand> displayedCountries = <Brand>[].obs;
  final RxString searchQuery = ''.obs;

  RxInt index = 0.obs;
  RxInt brandId = 0.obs;
  RxString brandName = ''.obs;
  RxString name = ''.obs; // Assuming it's a string

  @override
  void onInit() {
    super.onInit();
    load();
  }

  void load() async {
    try {
      await BaseClient.get(
        Constants.brands,
        onSuccess: (response) {
          BrandsResponse loadedBrands = brandsResponseFromJson(response.toString());
          brands.value= loadedBrands.brands;
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
        },
        onError: (error) {
          BaseClient.handleApiError(error);
          error.printInfo();
        },
      );
      await BaseClient.get(
        '${Constants.brandDetails}$brandId}',
        onSuccess: (response) {
          BrandResponse loadedCars = brandResponseFromJson(response.toString());
          brandCar.value = loadedCars.brandCar;
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
