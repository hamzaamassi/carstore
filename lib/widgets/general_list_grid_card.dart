// ignore_for_file: dead_code

import 'package:carstore_car/widgets/section_list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralListGridCard extends StatelessWidget {
  const GeneralListGridCard({
    Key? key,
    this.scrollDirection = Axis.vertical,
    required this.list,
    this.title,
    this.showMoreText = '',
    this.onClickMoreText,
    required this.itemBuilder,
    required this.heightSizedBox,
    this.style,
    this.crossAxisCount,
    this.mainAxisSpacing,
    this.mainAxisExtent,
    this.crossAxisSpacing,
    this.physics,
  }) : super(key: key);

  final Axis scrollDirection;
  final List list;
  final String? title;
  final VoidCallback? onClickMoreText;
  final int heightSizedBox;
  final int? crossAxisCount;
  final double? mainAxisSpacing;
  final double? mainAxisExtent;
  final double? crossAxisSpacing;
  final String? showMoreText;
  final TextStyle? style;
  final ScrollPhysics? physics;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        SectionListTitle(
          title: title,
          showMoreText: showMoreText!,
          onClickMoreText: onClickMoreText,
          style: style,
        ),
        SizedBox(
          height: heightSizedBox.h,
          child: GridView.builder(
            itemCount: list.length,
            scrollDirection: scrollDirection,
            physics: physics ?? const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 20.h),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount ?? 2,
                mainAxisSpacing: mainAxisSpacing ?? 20.w,
                mainAxisExtent: mainAxisExtent ?? 225.h,
                crossAxisSpacing: crossAxisSpacing ?? 20.h),
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
