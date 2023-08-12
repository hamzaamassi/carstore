import 'package:e_commerce_car/app/cars/controllers/car_details_controller.dart';
import 'package:e_commerce_car/app/cars/model/compressed_model.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageMiniCompressedCard extends GetView<CarDetailsController> {
  const ImageMiniCompressedCard({Key? key, required this.compressed}) : super(key: key);
final CompressedModel compressed;
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          width: 48.w,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5.r)),
        ),
        Container(
          width: 48.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Theme.of(context)
                  .colorScheme
                  .copyWith(
                  primary: LightThemeColors.scaffoldBackgroundColor
                      .withOpacity(0.3))
                  .primary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("200",
                  style: TextStyle(
                      fontSize: MyFonts.smallTextSize,
                      color: LightThemeColors.backgroundColor)),
              Text("Images",
                  style: TextStyle(
                      fontSize: MyFonts.smallTextSize,
                      color: LightThemeColors.backgroundColor))
            ],
          ),
        ),
      ],
    );
  }
}
