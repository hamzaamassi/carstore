import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:carstore/app/auth/controller/login_location_controller.dart';

class AlphabetScrollViewCountry extends StatelessWidget {
  const AlphabetScrollViewCountry({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginLocationController controller = Get.find();
    return Obx(
          () {
        var filteredCountries = controller.displayedCountries.where((country) =>
            country.name!.toLowerCase().contains(controller.searchQuery.value.toLowerCase())).toList();

        return AlphabetScrollView(
          list: filteredCountries.map((e) => AlphaModel(e.name ?? '')).toList(),
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
                  // color: Theme.of(context).primaryColor,
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
            return Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: ListTile(
                title: Text(id),
                onTap: () {
                  controller.name.value = id;
                  controller.index.value = k;
                },
              ),
            );
          },
        );
      },
    );
  }
}
