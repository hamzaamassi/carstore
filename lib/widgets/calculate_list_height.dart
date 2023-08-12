import 'package:flutter_screenutil/flutter_screenutil.dart';

int calculateListHeight(List list,int heightItem,int heightseparator) {
  double itemHeight = heightItem.h;
  double separatorHeight = heightseparator.h;
  int itemCount = list.length;
  return ((itemHeight -10) * itemCount + separatorHeight * (itemCount - 1)).toInt();
}
