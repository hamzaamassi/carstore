import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class CommunityPage extends GetView {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      // backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            getSearch(
              trailingIcon: AppIcons.publish,
              trailingOnTap: () => {},
              isSearch: true,
              circleAvatarColor: LightThemeColors.backgroundColor,
              trailingColor: LightThemeColors.primaryColor,
              size: 14,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 36.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.r,
                                      backgroundImage: const NetworkImage(
                                          "https://images.pexels.com/photos/1484806/pexels-photo-1484806.jpeg?auto=compress&cs=tinysrgb&w=800"),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Ali",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    )
                                  ],
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 20.w,
                                ),
                            itemCount: 5),
                      ),
                      Row(
                        children: [
                          Text(
                            "Recommend",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: LightThemeColors.primaryColor,
                                    ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color:LightThemeColors.primaryColor,
                            size: 30.h,
                          ),
                        ],
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25.r,
                                        backgroundImage: const NetworkImage(
                                            "https://images.pexels.com/photos/1484806/pexels-photo-1484806.jpeg?auto=compress&cs=tinysrgb&w=800"),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Prescott",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: LightThemeColors.primaryColor,
                                                ),
                                          ),
                                          Text(
                                            "BMW 3 Series owner",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 24.h,
                                        width: 71.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: LightThemeColors.backgroundColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "+ Follow",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: LightThemeColors.primaryColor,
                                                ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.h, bottom: 10.h),
                                    child: Text(
                                      "Volkswagen T-Roc: Interior dimensions revealed",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity.w,
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color: Colors.white,
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*"),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.h),
                                    child: Row(
                                      children: [
                                        Text(
                                          "5 days ago",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: SvgPicture.asset(
                                            "assets/images/group.svg",
                                            height: 15.h,
                                          ),
                                        ),
                                        Text(
                                          "10",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: SvgPicture.asset(
                                            "assets/images/chat.svg",
                                            height: 15.h,
                                          ),
                                        ),
                                        Text(
                                          "10",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: SvgPicture.asset(
                                            "assets/images/like.svg",
                                            height: 15.h,
                                          ),
                                        ),
                                        Text(
                                          "10",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20.h,
                              ),
                          itemCount: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
