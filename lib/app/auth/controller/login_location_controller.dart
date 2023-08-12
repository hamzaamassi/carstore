import 'package:carstore_car/models/country.dart';
import 'package:carstore_car/models/country_list.dart';
import 'package:get/get.dart';

class LoginLocationController extends GetxController {
  final RxList<Country> countries = CountryList.obs;
  final RxList<Country> displayedCountries = <Country>[].obs;
  final RxString searchQuery = ''.obs;

  final RxInt index = 0.obs;
  final RxString name = ''.obs;

  @override
  void onInit() {
    super.onInit();
    displayedCountries.value = countries;
  }

  void searchProducts(String query) {
    searchQuery.value = query;
    displayedCountries.value = countries.where((country) {
      final lowercaseName = country.name!.toLowerCase();
      return lowercaseName.contains(searchQuery.value.toLowerCase());
    }).toList();
  }
}
