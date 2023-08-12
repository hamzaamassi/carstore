import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    Key? key,
    required this.image,
    required this.imageSelected,
    this.title,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String image;
  final String imageSelected;
  final String? title;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: GestureDetector(
          onTap: onPressed,
          child: isSelected
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      imageSelected,
                      height: 18.h,
                      width: 18.w,
                    ),
                    if (title?.isNotEmpty ?? false)
                      Text(
                        title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      image,
                      height: 16.h,
                      width: 16.w,
                    ),
                    if (title?.isNotEmpty ?? false)
                      Text(
                        title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.grey,
                            ),
                      )
                  ],
                ),
        ),
      ),
    );
  }
}
