// ignore_for_file: deprecated_member_use, avoid_print, must_be_immutable, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:carstore_car/app/cars/controllers/car_details_controller.dart';
import 'package:carstore_car/app/cars/widget/price_tabs_widget.dart';
import 'package:carstore_car/app/cars/widget/qa_tabs_widget.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/widgets/alphabet_scroll_view_country.dart';
import 'package:carstore_car/widgets/custom_primary_button.dart';
import 'package:carstore_car/widgets/custom_text_field.dart';
import 'package:carstore_car/widgets/general_list_horizontal_card.dart';
import 'package:carstore_car/widgets/general_search.dart';
import 'package:carstore_car/widgets/image_mini_compressed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class CarDetailsPage extends GetView<CarDetailsController> {
  const CarDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    controller.carId = arguments["carId"];
    return GetBuilder<CarDetailsController>(
        init: CarDetailsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: LightThemeColors.backgroundColor,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
                              Text(
                                controller.countriesName[5],
                              ),
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
                            child: Image.asset(
                              AppIcons.p718,
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
                          itemBuilder: (context,index){
                            final list = controller.compressed[index];
                            return ImageMiniCompressedCard(compressed: list,);
                          },
                        ),
                        SizedBox(height: 20.h),
                        controller.valueOffers == false
                            ? controller.showBottonSheetCity == false
                                ? controller.buildContentContainer()
                                : controller.buildAlphabetCountryContainer()
                            : controller.buildGetOfferContainer()
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
