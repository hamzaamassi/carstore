import 'package:carstore_car/app/cars/controllers/car_controller.dart';
import 'package:carstore_car/app/cars/model/compressed_model.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageMiniCompressedCard extends GetView<CarController> {
  const ImageMiniCompressedCard({Key? key, required this.compressed})
      : super(key: key);
  final CompressedModel compressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 48.w,
          decoration: BoxDecoration(
              color: LightThemeColors.iconColor.withOpacity(0.5),
              image: DecorationImage(
                  image: AssetImage(compressed.image), fit: BoxFit.cover),
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
              Text(compressed.details,
                  style: TextStyle(
                      fontSize: MyFonts.smallTextSize,
                      color: LightThemeColors.backgroundColor)),
              Text(
                compressed.name,
                style: TextStyle(
                    fontSize: MyFonts.smallTextSize,
                    color: LightThemeColors.dividerColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
