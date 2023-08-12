import 'package:carstore_car/app/brand/model/brand.dart';
import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/home/model/home_response.dart';
import 'package:carstore_car/app/services/base_client.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {


  RxList<SliderModel> sliderList = RxList();
  RxList<Brand> brandList = RxList();
  RxList<Car> carList = RxList();

  List<Brand> brands = [];
  List<Brand> displayedCountries = <Brand>[];
  String searchQuery = '';
  int index = 0;
  String name = '';

  @override
  void onReady() async {
    super.onReady();
    loadHome();
    brands = brandList;
  }

  void loadHome() async {
    try {
      await BaseClient.get(
        Constants.home,
        onSuccess: (response) {
          HomeResponse loadedHome = homeResponseFromJson(response.toString());
          sliderList.value = loadedHome.data.sliders;
          brandList.value = loadedHome.data.brands;
          carList.value= loadedHome.data.cars;
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
  void searchProducts(String query) {
    searchQuery = query;
    displayedCountries = brands.where((country) {
      final lowercaseName = country.name.toLowerCase();
      return lowercaseName.contains(searchQuery.toLowerCase());
    }).toList();
  }

}