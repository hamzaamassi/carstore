import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension ImageExtesions on String? {
  ImageProvider getImageProvider({
    String placeHolder = 'assets/images/test_111.jpg',
  }) {
    if (this != null) {
      try {
        if (isWebImage) {
          return NetworkImage(this!);
        } else {
          return AssetImage(this!);
        }
      } catch (e) {
        return AssetImage(placeHolder);
      }
    } else {
      return AssetImage(placeHolder);
    }
  }

  Widget buildImage({
    double? width,
    double? height,
    String placeHolder = 'assets/images/test_111.jpg',
  }) {
    if (this == null) {
      return Image.asset(placeHolder);
    }
    try {
      String handledString = this!;
      return handledString.isWebImage
          ? handledString.isSvg
          ? SvgPicture.network(handledString)
          : Image.network(handledString)
          : handledString.isSvg
          ? SvgPicture.asset(handledString)
          : Image.asset(handledString);
    } catch (e) {
      return Image.asset(placeHolder);
    }
  }

  bool get isWebImage => this?.startsWith('http') ?? false;

  bool get isSvg => this?.endsWith('svg') ?? false;
}
