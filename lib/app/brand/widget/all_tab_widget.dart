import 'package:e_commerce_car/app/brand/controller/brand_controller.dart';
import 'package:e_commerce_car/widgets/calculate_list_height.dart';
import 'package:e_commerce_car/widgets/car_details_card.dart';
import 'package:e_commerce_car/widgets/general_list_horizontal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTapWidget extends GetView<BrandController> {
  const AllTapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          GeneralListHorizontalCard(
            list: controller.brandCar,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            showMoreText: null,
            itemBuilder: (context, index) {
              var list = controller.brandCar[index];
              return CarDetailsCard(brandCar: list);
            },
            separator: 15,
            heightSizedBox: calculateListHeight(controller.cars, 95, 15),
          )
        ],
      ),
    );
    return Container();

  }
}
