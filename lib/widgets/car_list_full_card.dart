// ignore_for_file: unrelated_type_equality_checks, dead_code, library_private_types_in_public_api

import 'package:carstore_car/app/home/model/home_response.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/models/app_shimmers.dart';
import 'package:carstore_car/widgets/car_full_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarsListFullCard extends StatefulWidget {
  const CarsListFullCard({
    Key? key,
    this.scrollDirection = Axis.horizontal,
    required this.car,
    this.title,
    this.opacityTitle,
  }) : super(key: key);

  final Axis scrollDirection;
  final List<SliderModel> car;
  final String? title;
  final String? opacityTitle;

  @override
  _CarsListFullCardState createState() => _CarsListFullCardState();
}

class _CarsListFullCardState extends State<CarsListFullCard> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 168.h,
          child: Stack(
                  children: [
                    Expanded(
                      child: CarouselSlider.builder(
                        carouselController: controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                current = index;
                              });
                            }),
                        itemCount: widget.car.length,
                        itemBuilder: (BuildContext context, int index,
                                int realIndex) =>
                            CarsFullCard(
                          car: widget.car[index],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8.h,
                      right: 0.w,
                      left: 0.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.car.asMap().entries.map(
                          (entry) {
                            return current == entry.key
                                ? GestureDetector(
                                    onTap: () =>
                                        controller.animateToPage(entry.key),
                                    child: Container(
                                      width: 6.w,
                                      height: 3.h,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 8.w,
                                        horizontal: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          color: LightThemeColors.primaryColor
                                          ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () =>
                                        controller.animateToPage(entry.key),
                                    child: Container(
                                      width: 3.w,
                                      height: 3.h,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                        horizontal: 4.w,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: LightThemeColors.iconColor,
                                      ),
                                    ),
                                  );
                          },
                        ).toList(),
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
