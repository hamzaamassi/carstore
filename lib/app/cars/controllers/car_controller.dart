import 'package:e_commerce_car/app/brand/model/brand.dart';
import 'package:e_commerce_car/app/cars/model/car.dart';
import 'package:e_commerce_car/app/cars/model/car_list_response.dart';
import 'package:e_commerce_car/app/services/base_client.dart';
import 'package:e_commerce_car/utils/constants.dart';
import 'package:get/get.dart';

class CarController extends GetxController{
  RxList<Brand> brands = RxList();
  RxList<Car> cars = RxList();

  @override
  void onReady() async {
    super.onReady();
    loadCars();
  }
  void loadCars() async {
    try {
      await BaseClient.get(
        Constants.cars,
        onSuccess: (response) {
          CarsResponse loadedCars = carsResponseFromJson(response.toString());
          cars.value= loadedCars.cars;
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

