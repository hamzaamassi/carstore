import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/cars/model/car_list_response.dart';
import 'package:carstore_car/app/cars/model/car_response.dart';
import 'package:carstore_car/app/cars/model/compressed_model.dart';
import 'package:carstore_car/app/cars/model/key_specs_model.dart';
import 'package:carstore_car/app/cars/widget/photo&video_tabs_widget.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/models/country.dart';
import 'package:carstore_car/models/country_list.dart';
import 'package:carstore_car/routes/app_pages.dart';
import 'package:carstore_car/services/base_client.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:carstore_car/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
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
  bool isLoading = true;
  final count = 0.obs;
  int index = 0;
  RxBool isOffer = false.obs;



  void increment() => count.value++;

  void loadCarDetails(int id) async {
    try {
      isLoading = true;
      final url = '${Constants.carDetails}$id';
      await BaseClient.get(
        url,
        onSuccess: (response) {
          CarResponse loadedCar = carResponseFromJson(response.toString());
          carDetails = loadedCar.car;
          Get.toNamed(Routes.carDetails);
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
          CarsResponse loadedCar = carsResponseFromJson(response.toString());
          cars.value = loadedCar.cars;
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
  List<int> myColors =
      [0Xfff00AC5E, 0XfffF6C604, 0XfffFF3131, 0Xfff424243, 0Xfff006DEA].obs;
  List<String> choices = [
    "Photos",
    "Videos",
  ];

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

  void changeValueOfIndex(value) {
    index = value;
    update();
  }

  void changeValueOfIndexindexChoices(value) {
    update();
  }

  Widget bulidItems(context, index) => Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
              onTap: () {
                changeValueOfIndex(index);
              },
              child: CircleAvatar(
                radius: 10.h,
                backgroundColor: Color(myColors[index]),
              )),
          this.index == index
              ? CircleAvatar(
                  radius: 15.h,
                  backgroundColor: Color(myColors[index]).withOpacity(0.55),
                )
              : Container(),
        ],
      );

  Widget bulidSecondItemList() => Container(
        height: 543,
        decoration: BoxDecoration(
          color: LightThemeColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.r),
            topLeft: Radius.circular(15.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: DefaultTabController(
            length: 2, // Change this to the number of tabs you want
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: const TabBar(
                    isScrollable: true,
                    labelColor: LightThemeColors.primaryColor,
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    unselectedLabelColor: LightThemeColors.dividerColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    indicatorColor: LightThemeColors.primaryColor,
                    tabs: [
                      Tab(text: 'Photots'),
                      Tab(text: 'Videos'),
                      // Add more tabs as needed
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      PhotoAndVideoTabsWidget(),
                      PhotoAndVideoTabsWidget(),
                    ],
                  ),
                ),
                CustomPrimaryButton(
                  onTap: () {},
                  text: 'Get Offers from Dealer',
                ),
                SizedBox(height: 30.h)
              ],
            ),
          ),
        ),
      );

  Widget bulidItem(context, index) => Row(
        children: [
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppIcons.carPic)),
              borderRadius: BorderRadius.circular(10.r),
              color: LightThemeColors.scaffoldBackgroundColor,
            ),
          ),
          SizedBox(width: 22.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Porsche 718",
                style: TextStyle(
                  fontSize: MyFonts.sectionListTitle,
                  fontWeight: FontWeight.bold,
                  color: LightThemeColors.iconColor,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Porsche/Luxury/The 2.3L EcoBoost",
                style: TextStyle(
                    fontSize: MyFonts.chipTextSize,
                    color: LightThemeColors.dividerColor),
              ),
              SizedBox(height: 13.h),
              Text(
                "\$62,000.00-\$74,000.00",
                style: TextStyle(
                  fontSize: MyFonts.body2TextSize,
                  color: LightThemeColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      );
}
