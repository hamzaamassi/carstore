import 'package:carstore_car/app/brand/model/brand.dart';
import 'package:carstore_car/app/brand/model/brand_list_response.dart';
import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/cars/model/car_list_response.dart';
import 'package:carstore_car/app/services/base_client.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  RxList<Brand> brands = RxList();
  RxList<Car> cars = RxList();

  @override
  void onReady() async {
    super.onReady();
    loadBrand();
    loadCars();
  }

  void loadCars() async {
    try {
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
    } catch (e) {
      e.printInfo();
    }
  }

  void loadBrand() async {
    brands = [
      Brand(id: 1, name: 'Sales', logo: AppIcons.sales),
      Brand(id: 2, name: 'Hot', logo: AppIcons.hot),
      Brand(id: 3, name: 'Featured', logo: AppIcons.featured),
      Brand(id: 4, name: 'Discount', logo: AppIcons.discount),
    ].obs;
  }
// void loadBrand() async {
//   try {
//     await BaseClient.get(
//       Constants.brands,
//       onSuccess: (response) {
//         BrandsResponse loadedBrands = brandsResponseFromJson(response.toString());
//         brands.value= loadedBrands.brands;
//       },
//       onError: (error) {
//         BaseClient.handleApiError(error);
//         error.printInfo();
//       },
//     );
//   } catch (e) {
//     e.printInfo();
//   }
// }
}
