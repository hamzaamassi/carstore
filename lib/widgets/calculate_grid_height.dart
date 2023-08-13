import 'package:flutter_screenutil/flutter_screenutil.dart';

int calculateGridHeight(List list, int itemHeight,
    int separatorHeight, int crossAxisCount) {
  int count = list.length;
  double height = itemHeight.h;
  int rowCount = (count / crossAxisCount).ceil();
  return (((height-15) * rowCount) + (separatorHeight * rowCount)).toInt();
}