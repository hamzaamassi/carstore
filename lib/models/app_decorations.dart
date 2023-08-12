import 'package:carstore_car/core/extensions/image_extensions.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';

class BoxDecorations {
  static BoxDecoration buildDefaultBoxDecoration({
    double radius = 8.0,
    Color color = Colors.white,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color,
    );
  }

  static BoxDecoration roundedBox({
    double boxRadius = 4.0,
    Color boxColor = Colors.white,
    double borderWidth = 1,
    Color borderColor = Colors.black12,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(boxRadius),
      color: boxColor,
      border: Border.all(
        width: borderWidth,
        color: borderColor,
      ),
    );
  }

  static BoxDecoration buildCartCircularButtonDecoration(enabled) {
    return BoxDecoration(
      borderRadius: const BorderRadiusDirectional.only(
        topStart: Radius.circular(4),
        bottomStart: Radius.circular(4),
        topEnd: Radius.circular(4),
        bottomEnd: Radius.circular(4),
      ),
      color: enabled ? LightThemeColors.scaffoldBackgroundColor : LightThemeColors.appBarIconsColor,
    );
  }

  static BoxDecoration buildCircularButtonDecoration_1() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(36.0),
      color: Colors.white.withOpacity(.80),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.08),
          blurRadius: 20,
          spreadRadius: 0.0,
          offset: const Offset(0.0, 10.0), // shadow direction: bottom right
        )
      ],
    );
  }

  static BoxDecoration buildImageDecoration(
    String? image, {
    String placeHolder = 'assets/images/test_111.jpg',
    BoxFit boxFit = BoxFit.cover,
    BorderRadius? borderRadius,
    bool enableShadow = false,
  }) {
    return BoxDecoration(
      borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      boxShadow: enableShadow ? LightThemeColors.boxShadow : null,
      image: DecorationImage(
        image: image.getImageProvider(placeHolder: placeHolder),
        fit: boxFit,
      ),
    );
  }
}
