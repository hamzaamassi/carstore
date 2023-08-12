import 'package:flutter_screenutil/flutter_screenutil.dart';

int calculateGridHeight(List list, double itemHeight,
    double separatorHeight, double crossAxisCount) {
  int itemCount = list.length;
  int rowCount = (itemCount / crossAxisCount).ceil();
  return ((itemHeight.h - 10) * rowCount + separatorHeight * (rowCount - 1)).toInt();
}