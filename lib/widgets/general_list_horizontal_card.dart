// ignore_for_file: dead_code

import 'package:carstore_car/widgets/section_list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralListHorizontalCard extends StatelessWidget {
  const GeneralListHorizontalCard({
    Key? key,
    this.scrollDirection = Axis.horizontal,
    required this.list,
    this.title,
    this.showMoreText = 'More',
    this.onClickMoreText,
    required this.itemBuilder,
    required this.separator,
    required this.heightSizedBox,
    this.physics = const BouncingScrollPhysics(),
    this.style, this.separatorWidget,
  }) : super(key: key);

  final Axis scrollDirection;
  final List list;
  final String? title;
  final String? showMoreText;
  final VoidCallback? onClickMoreText;
  final int separator;
  final Widget? separatorWidget;
  final TextStyle? style;
  final int heightSizedBox;
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: showMoreText != null,
          child: SectionListTitle(
            title: title,
            showMoreText: showMoreText,
            onClickMoreText: onClickMoreText,
            style: style,
          ),
        ),
        SizedBox(
          height: heightSizedBox.h,
          child:ListView.separated(
                  itemCount: list.length,
                  shrinkWrap: true,
                  primary: false,
                  physics: physics,
                  //   parent: AlwaysScrollableScrollPhysics(),
                  // ),
                  scrollDirection: scrollDirection,
                  separatorBuilder: (context, index) =>
                      scrollDirection == Axis.horizontal
                          ? separatorWidget??SizedBox(width: separator.w)
                          : separatorWidget??SizedBox(height: separator.h),
                  itemBuilder: itemBuilder,
                ),
        ),
      ],
    );
  }
}
