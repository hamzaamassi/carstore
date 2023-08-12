import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:carstore_car/app/brand/controller/brand_controller.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:carstore_car/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlphabetScrollViewBrand extends GetView<BrandController> {
  const AlphabetScrollViewBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt? brandId;
    RxString? branName;
    Map<String, dynamic> arguments;

    // Sort the brands list by name
    final sortedBrands = controller.brands.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return AlphabetScrollView(
      list: sortedBrands.map((brand) => AlphaModel(brand.name)).toList(),
      alignment: LetterAlignment.right,
      itemExtent: 50,
      unselectedTextStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
      selectedTextStyle: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
      overlayWidget: (value) => Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.circle,
            size: 50.r,
            color: Colors.white,
          ),
          Container(
            height: 50.h,
            width: 50.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              value.toUpperCase(),
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
      isAlphabetsFiltered: true,
      itemBuilder: (_, k, id) {
        final brand = sortedBrands[k]; // Use sortedBrands here

        return Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: GestureDetector(
            onTap: () => {
              brandId!.value = brand.id,
              branName!.value = brand.name,
              arguments = {
                "brandId": brandId,
                "branName": branName,
              },
              controller.name.update((value) => brand.name), // Update the name
              controller.index.update((value) => k),
              Get.toNamed(Routes.brandDetails, arguments: arguments)
            },
            child: SizedBox(
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // Align at the start of the row
                children: [
                  Image.network(
                    brand.logo,
                    height: 25.h,
                    width: 25.w,
                  ),
                  SizedBox(width: 10.w), // Add spacing between logo and name
                  Text(
                    brand.name,
                    style: TextStyle(fontSize: MyFonts.body1TextSize),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
