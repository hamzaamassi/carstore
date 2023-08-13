// ignore_for_file: deprecated_member_use, avoid_print

import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/cars/model/car_list_response.dart';
import 'package:carstore_car/app/cars/model/car_response.dart';
import 'package:carstore_car/app/cars/model/compressed_model.dart';
import 'package:carstore_car/app/cars/model/key_specs_model.dart';
import 'package:carstore_car/models/country.dart';
import 'package:carstore_car/models/country_list.dart';
import 'package:carstore_car/services/base_client.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:get/get.dart';

class CarDetailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  onReady() {
    super.onReady();
    print("carId ${carId.value}");
    loadCarDetails();
  }

  late Car carDetails;
  RxList cars = RxList();
  RxInt carId = 0.obs;
  bool isChecked = false;
  bool showBottonSheetCity = false;
  bool valueOffers = false;
  String? nameOfCountry;
  String dropDownValue = 'City';
  double rotationX = 0.0;
  double rotationY = 0.0;

  List<KeySpecsModel> keySpecs = [
    KeySpecsModel(
        name: "3995 CC", image: AppIcons.enginePower, details: "Engine Power"),
    KeySpecsModel(
        name: "360 N·m", image: AppIcons.maxTorque, details: "Max Torque"),
    KeySpecsModel(
        name: "0-100km/h-4s",
        image: AppIcons.acceleration,
        details: "Acceleration"),
  ];
  List<CompressedModel> compressed = [
    CompressedModel(name: "Images", image: AppIcons.carPic, details: "200"),
    CompressedModel(name: "Exterior", image: AppIcons.p718, details: "6"),
    CompressedModel(name: "Interior", image: AppIcons.pic, details: "450"),
    CompressedModel(name: "Videos", image: AppIcons.p718, details: "240"),
  ];
  List<String> countriesName = [];
  List<Country> countries = CountryList;

  void loadCarDetails() async {
    try {
      final url = '${Constants.carDetails}${carId.value}';
      print("URL : " + url);
      await BaseClient.get(
        url,
        onSuccess: (response) {
          CarResponse loadedCar = carResponseFromJson(response.toString());
          carDetails = loadedCar.car;
        },
        onError: (error) {
          BaseClient.handleApiError(error);
          error.printInfo();
        },
      );
      await BaseClient.get(
        Constants.cars,
        onSuccess: (response) {
          CarsResponse loadedCar = carsResponseFromJson(response.toString());
          cars.value = loadedCar.cars;
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

  changValueBottonSheetCity(bool value) {
    showBottonSheetCity = value;
    update();
  }

  changeValueOfDropDownValue(value) {
    dropDownValue = value;
    update();
  }

  changeNameOfCountry(value) {
    nameOfCountry = value;
    update();
  }

  changeValueOfOffers(bool value) {
    valueOffers = value;
    update();
  }

  void changeValueOfTransform(rotationX, rotationY) {
    this.rotationX += rotationX;
    this.rotationY -= rotationY;
    update();
  }

  changeValueOfCheckBox(bool value) {
    isChecked = value;
    if (isChecked = true) {}
    update();
  }

  void countriesList() {
    countriesName = [];
    update();
    for (var element in countries) {
      countriesName.add(element.name ?? "");
      update();
      print(countriesName.length);
    }
  }
}
