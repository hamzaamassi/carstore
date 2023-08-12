// ignore_for_file: deprecated_member_use, avoid_print


import 'package:carstore_car/app/cars/model/car.dart';
import 'package:carstore_car/app/cars/model/car_list_response.dart';
import 'package:carstore_car/app/cars/model/car_response.dart';
import 'package:carstore_car/app/cars/model/compressed_model.dart';
import 'package:carstore_car/app/cars/model/key_specs_model.dart';
import 'package:carstore_car/app/cars/widget/price_tabs_widget.dart';
import 'package:carstore_car/app/cars/widget/qa_tabs_widget.dart';
import 'package:carstore_car/app/services/base_client.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/models/country.dart';
import 'package:carstore_car/models/country_list.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/utils/constants.dart';
import 'package:carstore_car/widgets/alphabet_scroll_view_country.dart';
import 'package:carstore_car/widgets/custom_primary_button.dart';
import 'package:carstore_car/widgets/custom_text_field.dart';
import 'package:carstore_car/widgets/general_list_horizontal_card.dart';
import 'package:carstore_car/widgets/key_specs_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CarDetailsController extends GetxController {
  Rx<Car> carDetails = Rx(Car as Car);
  RxList cars = RxList();
  RxInt? carId = 0.obs;
  bool isChecked = false;
  bool showBottonSheetCity = false;
  changValueBottonSheetCity(bool value) {
    showBottonSheetCity = value;
    print(showBottonSheetCity);
    update();
  }
  String? nameOfCountry;
  var dropDownValue =
      "City"; // add one value as the defaul one which must exists in the dropdown value
  changeValueOfDropDownValue(value) {
    dropDownValue = value;
    print(value);
    update();
  }
  changeNameOfCountry(value) {
    nameOfCountry = value;
    update();
  }

  bool valueOffers = false;

  changeValueOfOffers(bool value) {
    valueOffers = value;
    update();
  }

  double rotationX = 0.0;
  double rotationY = 0.0;

  void changeValueOfTransform(rotationX, rotationY) {
    this.rotationX += rotationX;
    this.rotationY -= rotationY;
    update();
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

  changeValueOfCheckBox(bool value) {
    isChecked = value;
    if (isChecked = true) {
      //Get.offNamed("/compareCarsView");
    }
    update();
  }

  RatingBar raitingBar() {
    return RatingBar.builder(
      initialRating: 3,
      unratedColor: LightThemeColors.dividerColor,
      updateOnDrag: true,
      glowColor: LightThemeColors.primaryColor.withOpacity(0),
      // Remove glow effect
      glowRadius: 0.0,
      // Remove glow
      minRating: 1,
      itemSize: 15.h,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
      itemBuilder: (context, _) => SvgPicture.asset(AppIcons.selectedStar,
          color: LightThemeColors.primaryColor),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  Container buildContentContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          topLeft: Radius.circular(25.r),
        ),
        color: LightThemeColors.scaffoldBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Porsche 718",
                          style: TextStyle(
                              fontSize: MyFonts.sectionListTitle,
                              fontWeight: FontWeight.bold,
                              color: LightThemeColors.iconColor)),
                      const Spacer(),
                      Text("Compare",
                          style: TextStyle(
                              fontSize: MyFonts.headline6TextSize,
                              color: LightThemeColors.dividerColor)),
                      Checkbox(
                        activeColor: LightThemeColors.primaryColor,
                        side: BorderSide(
                            color: LightThemeColors.dividerColor,
                            style: BorderStyle.solid,
                            strokeAlign: -3.h),
                        value: isChecked,
                        onChanged: (bool? value) {
                          changeValueOfCheckBox(value!);
                        },
                      ),
                    ],
                  ),
                  Text("\$62,000.00-\$74,000.00  ",
                      style: TextStyle(
                          fontSize: MyFonts.body2TextSize,
                          color: LightThemeColors.primaryColor)),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30.h, bottom: 20.h, right: 15.w),
                    child: Row(
                      children: [
                        raitingBar(),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "268 review",
                          style: TextStyle(
                            fontSize: MyFonts.headline6TextSize,
                            color: LightThemeColors.secondaryBodyTextColor
                                .withOpacity(.8),
                          ),
                        ),
                        const Spacer(),
                        Text("Rate This car",
                            style: TextStyle(
                                fontSize: MyFonts.headline6TextSize,
                                color: LightThemeColors.primaryColor)),
                      ],
                    ),
                  ),
                  GeneralListHorizontalCard(
                    list: keySpecs,
                    itemBuilder: (context,index){
                      final list = keySpecs[index];
                      return KeySpecsCard(keySpecs: list,);
                    },
                    separator: 18,
                    heightSizedBox: 100,
                    title: 'Key Spacs',
                    style: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        color: LightThemeColors.dividerColor),
                    onClickMoreText: () => {},
                    physics: const NeverScrollableScrollPhysics(),
                    showMoreText: 'All Spacs',
                  )
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  color: LightThemeColors.cardColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DefaultTabController(
                        length: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              constraints: const BoxConstraints(maxWidth: 200),
                              // Limit tab bar width
                              child: const TabBar(
                                isScrollable: true,
                                // Set this to true
                                labelColor: LightThemeColors.primaryColor,
                                labelStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                unselectedLabelStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                unselectedLabelColor:
                                    LightThemeColors.dividerColor,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorWeight: 3,
                                indicatorColor: LightThemeColors.primaryColor,

                                tabs: [
                                  Tab(text: 'Price'),
                                  Tab(text: 'Reviews'),
                                  Tab(text: 'QA'),
                                  // Add more tabs as needed
                                ],
                              ),
                            ),
                            const Expanded(
                              child: TabBarView(
                                children: [
                                  // Your content for Tab 1
                                  PriceTabsWidget(),
                                  // Your content for Tab 2
                                  Center(
                                    child: Text('Reviews Tab Content'),
                                  ),
                                  QATabsWidget()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildAlphabetCountryContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r)),
          color: LightThemeColors.cardColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: const AlphabetScrollViewCountry(),
      ),
    );
  }

  Container buildGetOfferContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
        color: LightThemeColors.cardColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Center(
                    child: Text("Get Offers from Dealer",
                        style: TextStyle(
                            fontSize: MyFonts.body2TextSize,
                            color: LightThemeColors.dividerColor)),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      AppIcons.closeIcon,
                      height: 13.h,
                      width: 13.w,
                      color: LightThemeColors.dividerColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  children: [
                    Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://s7d1.scene7.com/is/image/hyundai/2023-ioniq-6-limited-rwd-transmission-blue-pearl-profile:Vehicle-Carousel?fmt=webp-alpha")),
                        borderRadius: BorderRadius.circular(20.r),
                        color: LightThemeColors.scaffoldBackgroundColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Porsche 718",
                            style: TextStyle(
                                fontSize: MyFonts.sectionListTitle,
                                color: LightThemeColors.iconColor,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text("Porsche/Luxury/The 2.3L EcoBoost",
                            style: TextStyle(
                                fontSize: MyFonts.chipTextSize,
                                color: LightThemeColors.dividerColor)),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text("\$62,000.00-\$74,000.00",
                            style: TextStyle(
                                fontSize: MyFonts.body2TextSize,
                                color: LightThemeColors.primaryColor)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              CustomTextFormField(
                textInputAction: TextInputAction.next,
                suffixIcon: AppIcons.closeClear,
                labelText: 'Phone Number',
              ),
              SizedBox(height: 28.h),
              CustomTextFormField(
                textInputAction: TextInputAction.done,
                suffixIcon: AppIcons.closeClear,
                labelText: 'Name',
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: LightThemeColors.agentColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: LightThemeColors.agentColor),
                    ),
                    labelText: 'City',
                    labelStyle: TextStyle(
                        fontSize: MyFonts.body2TextSize,
                        color: LightThemeColors.appBarIconsColor),
                  ),
                  icon: const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 20,
                      color: LightThemeColors.appBarIconsColor,
                    ),
                  ),
                  onChanged: (String? newValue) {
                    changeValueOfDropDownValue(newValue);
                  },
                  dropdownColor: LightThemeColors.primaryColor,
                  items: countriesName
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: LightThemeColors.agentColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: LightThemeColors.agentColor),
                      ),
                      labelText: 'City',
                      labelStyle: TextStyle(
                          fontSize: MyFonts.body2TextSize,
                          color: LightThemeColors.appBarIconsColor),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 20,
                        color: LightThemeColors.appBarIconsColor,
                      ),
                    ),
                    onChanged: (String? newValue) {
                      changeValueOfDropDownValue(newValue);
                    },
                    dropdownColor: LightThemeColors.primaryColor,
                    items: countriesName
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: CustomPrimaryButton(
                  onTap: () {},
                  text: "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  void loadCarDetails() async {
    try {
      await BaseClient.get(
        Constants.carDetails,
        onSuccess: (response) {
          CarResponse loadedCar = carResponseFromJson(response.toString());
          carDetails.value = loadedCar.car;
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
}
