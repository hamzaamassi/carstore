import 'package:carstore_car/app/brand/model/brand.dart';
import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/cars/model/car_list_response.dart';
import 'package:carstore_car/app/home/model/home_response.dart';
import 'package:carstore_car/services/base_client.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppBottomBarController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  RxInt selectedIndex = 0.obs;
  bool isLoading = true;
  RxList<SliderModel> sliderList = RxList();
  RxList<Brand> brandList = RxList();
  RxList<Car> carList = RxList();
  RxList<Brand> brands = RxList();
  RxList<Car> cars = RxList();

  onTapNavFunction(int value) {
    selectedIndex.value = value;
    update();
  }

  @override
  void onInit() {
    loadHome();
    loadCars();
    loadBrand();
    super.onInit();
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

  void loadCars() async {
    try {
      isLoading = true;
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

}
