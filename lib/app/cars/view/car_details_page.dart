// ignore_for_file: deprecated_member_use, avoid_print, must_be_immutable, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:carstore/app/cars/controllers/car_controller.dart';
import 'package:carstore/app/cars/widget/price_tabs_widget.dart';
import 'package:carstore/app/cars/widget/qa_tabs_widget.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/alphabet_scroll_view_country.dart';
import 'package:carstore/widgets/custom_primary_button.dart';
import 'package:carstore/widgets/custom_text_field.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:carstore/widgets/image_mini_compressed_card.dart';
import 'package:carstore/widgets/key_specs_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class CarDetailsPage extends GetView<CarController> {
  const CarDetailsPage({Key? key}) : super(key: key);
  // var carId = Get.arguments['carId'];

  @override
  Widget build(BuildContext context) {
    controller.showBottonSheetCity = false;
    return GetBuilder<CarController>(
        init: CarController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: LightThemeColors.primaryColor,
                ),)
              : Scaffold(
                  backgroundColor: LightThemeColors.backgroundColor,
                  body: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: getSearch(
                          isSearch: false,
                          size: 14,
                          leadingIcon: AppIcons.backtrackIcon,
                          leadingColor: LightThemeColors.dividerColor,
                          trailingData: Row(
                            children: [
                              GestureDetector(
                                onTap: () => {},
                                child: Row(
                                  children: [
                                    Text(controller.carDetails.brand.name),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: LightThemeColors.dividerColor,
                                    ),
                                    SizedBox(width: 15.w),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                child: SvgPicture.asset(
                                  AppIcons.favorite,
                                ),
                                onTap: () => {},
                              )
                            ],
                          ),
                          trailingIcon: AppIcons.share,
                          trailingColor: LightThemeColors.dividerColor,
                          circleAvatarColor: Colors.transparent,
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onPanUpdate: (details) {
                                  controller.changeValueOfTransform(
                                    details.delta.dy * 0.01,
                                    details.delta.dx * 0.01,
                                  );
                                },
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY(controller.rotationY),
                                  alignment: FractionalOffset.center,
                                  child: Image.network(
                                    controller.carDetails.image,
                                    width: 400.w,
                                    height: 100.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              GeneralListHorizontalCard(
                                showMoreText: null,
                                heightSizedBox: 32,
                                separator: 20,
                                list: controller.compressed,
                                itemBuilder: (context, index) {
                                  final list = controller.compressed[index];
                                  return ImageMiniCompressedCard(
                                    compressed: list,
                                  );
                                },
                              ),
                              SizedBox(height: 20.h),
                              controller.valueOffers == false
                                  ? controller.showBottonSheetCity == false
                                      ? buildContentContainer()
                                      : buildAlphabetCountryContainer()
                                  : buildGetOfferContainer()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
        });
  }

  Widget buildContentContainer() => Container(
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
                        Text(controller.carDetails.name,
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
                          value: controller.isChecked,
                          onChanged: (bool? value) {
                            controller.changeValueOfCheckBox(value!);
                          },
                        ),
                      ],
                    ),
                    Text(
                        "\$${controller.carDetails.price}-\$${controller.carDetails.price * 1.25}",
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
                            "ratingsCount",
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
                      list: controller.keySpecs,
                      itemBuilder: (context, index) {
                        final list = controller.keySpecs[index];
                        return KeySpecsCard(
                          keySpecs: list,
                        );
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  color: LightThemeColors.cardColor,
                ),
                child: DefaultTabController(
                  length: 3,
                  // animationDuration: Duration.microsecondsPerMinute.hours,
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
                          unselectedLabelColor: LightThemeColors.dividerColor,
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
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          height: 685,
                          child: TabBarView(
                            children: [
                              PriceTabsWidget(),
                              const Center(child: Text('Reviews Tab Content')),
                              QATabsWidget()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildAlphabetCountryContainer() => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r)),
            color: LightThemeColors.cardColor),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: const AlphabetScrollViewCountry(),
        ),
      );

  Widget buildGetOfferContainer() => Container(
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
                      controller.changeValueOfDropDownValue(newValue);
                    },
                    dropdownColor: LightThemeColors.primaryColor,
                    items: controller.countriesName
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
                        controller.changeValueOfDropDownValue(newValue);
                      },
                      dropdownColor: LightThemeColors.primaryColor,
                      items: controller.countriesName
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

  Widget raitingBar() {
    return RatingBar.builder(
      initialRating: controller.carDetails.stars.toDouble(),
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
      onRatingUpdate: (rating) {},
    );
  }
}
