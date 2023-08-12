// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:e_commerce_car/app/brand/controller/brand_controller.dart';
import 'package:e_commerce_car/app/news/model/news_list.dart';
import 'package:e_commerce_car/app/video/models/video_list.dart';
import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/core/config/theme/my_fonts.dart';
import 'package:e_commerce_car/utils/app_icons.dart';
import 'package:e_commerce_car/widgets/calculate_list_height.dart';
import 'package:e_commerce_car/widgets/car_news_card.dart';
import 'package:e_commerce_car/widgets/car_similar_card.dart';
import 'package:e_commerce_car/widgets/car_video_card.dart';
import 'package:e_commerce_car/widgets/custom_text.dart';
import 'package:e_commerce_car/widgets/general_list_horizontal_card.dart';
import 'package:e_commerce_car/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrandSearchPage extends GetView<BrandController> {
  const BrandSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: LightThemeColors.scaffoldBackgroundColor,
    //   body: Column(
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
    //         child: Column(
    //           children: [
    //             getSearch(
    //               isSearch: true,
    //               size: 14,
    //               leadingIcon: AppIcons.backtrackIcon,
    //               leadingOnTap: () => {},
    //             ),
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //           child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 20.w),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Container(
    //                         height: 60.w,
    //                         width: 60.w,
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(10.r),
    //                           image: DecorationImage(
    //                               image: AssetImage(AppIcons.carPic)),
    //                           color: LightThemeColors.backgroundColor,
    //                         ),
    //                       ),
    //                       SizedBox(width: 15.w),
    //                       Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text("Mazda",
    //                               style: TextStyle(
    //                                   fontSize: MyFonts.sectionListTitle,
    //                                   color: LightThemeColors.iconColor,
    //                                   fontWeight: FontWeight.bold)),
    //                           SizedBox(height: 6.h),
    //                           Text("Brand introduction",
    //                               style: TextStyle(
    //                                   fontSize: MyFonts.headline6TextSize,
    //                                   color: LightThemeColors.dividerColor)),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                   Icon(
    //                     Icons.keyboard_arrow_right_outlined,
    //                     size: 20.h,
    //                     color: LightThemeColors.dividerColor,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(height: 30.h),
    //             Container(
    //               decoration: BoxDecoration(
    //                 color: LightThemeColors.backgroundColor,
    //                 borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(15.r),
    //                   topRight: Radius.circular(15.r),
    //                 ),
    //               ),
    //               child: Padding(
    //                 padding:
    //                     EdgeInsetsDirectional.only(start: 20.w, top: 20.h),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     SizedBox(
    //                       width: double.infinity.w,
    //                       height: 260.h,
    //                       child: Expanded(
    //                         child: DefaultTabController(
    //                           length: 4,
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Row(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   Container(
    //                                     constraints:
    //                                         BoxConstraints(maxWidth: 250.w),
    //                                     child: const TabBar(
    //                                       isScrollable: true,
    //                                       labelColor:
    //                                           LightThemeColors.primaryColor,
    //                                       labelStyle: TextStyle(
    //                                           fontSize: 14,
    //                                           fontWeight: FontWeight.bold),
    //                                       unselectedLabelStyle: TextStyle(
    //                                           fontSize: 14,
    //                                           fontWeight: FontWeight.bold),
    //                                       unselectedLabelColor:
    //                                           LightThemeColors.dividerColor,
    //                                       indicatorSize:
    //                                           TabBarIndicatorSize.label,
    //                                       indicatorWeight: 3,
    //                                       indicatorColor:
    //                                           LightThemeColors.primaryColor,
    //                                       tabs: [
    //                                         Tab(text: 'Hot'),
    //                                         Tab(text: 'Sedan'),
    //                                         Tab(text: 'SUV'),
    //                                         Tab(text: 'Luxury'),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsetsDirectional.only(
    //                                         end: 20.w),
    //                                     child: GestureDetector(
    //                                       onTap: () => {},
    //                                       child: Row(
    //                                         children: [
    //                                           CustomText(
    //                                             text: 'All',
    //                                             style: TextStyle(
    //                                                 fontSize: MyFonts
    //                                                     .headline6TextSize,
    //                                                 fontWeight:
    //                                                     FontWeight.bold),
    //                                           ),
    //                                           SizedBox(width: 6.w),
    //                                           const Icon(
    //                                             Icons
    //                                                 .arrow_forward_ios_outlined,
    //                                             size: 12,
    //                                             color: LightThemeColors
    //                                                 .primaryColor,
    //                                           )
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   )
    //                                 ],
    //                               ),
    //                               SizedBox(height: 20.h),
    //                               Expanded(
    //                                 child: TabBarView(
    //                                   children: [
    //                                     GeneralListHorizontalCard(
    //                                         list: ListCar,
    //                                         showMoreText: null,
    //                                         apiCallStatus: false,
    //                                         itemBuilder:
    //                                             (BuildContext, index) {
    //                                           var list = ListCar[index];
    //                                           return CarSimilarCard(
    //                                             car: list,
    //                                             color: LightThemeColors
    //                                                 .scaffoldBackgroundColor,
    //                                           );
    //                                         },
    //                                         separator: 15,
    //                                         heightSizedBox: 180),
    //                                     GeneralListHorizontalCard(
    //                                         showMoreText: null,
    //                                         list: ListCar,
    //                                         apiCallStatus: false,
    //                                         itemBuilder:
    //                                             (BuildContext, index) {
    //                                           var list = ListCar[index];
    //                                           return CarSimilarCard(
    //                                             car: list,
    //                                             color: LightThemeColors
    //                                                 .scaffoldBackgroundColor,
    //                                           );
    //                                         },
    //                                         separator: 15,
    //                                         heightSizedBox: 180),
    //                                     GeneralListHorizontalCard(
    //                                         showMoreText: null,
    //                                         list: ListCar,
    //                                         apiCallStatus: false,
    //                                         itemBuilder:
    //                                             (BuildContext, index) {
    //                                           var list = ListCar[index];
    //                                           return CarSimilarCard(
    //                                             car: list,
    //                                             color: LightThemeColors
    //                                                 .scaffoldBackgroundColor,
    //                                           );
    //                                         },
    //                                         separator: 15,
    //                                         heightSizedBox: 180),
    //                                     GeneralListHorizontalCard(
    //                                         showMoreText: null,
    //                                         list: ListCar,
    //                                         apiCallStatus: false,
    //                                         itemBuilder:
    //                                             (BuildContext, index) {
    //                                           var list = ListCar[index];
    //                                           return CarSimilarCard(
    //                                             car: list,
    //                                             color: LightThemeColors
    //                                                 .scaffoldBackgroundColor,
    //                                           );
    //                                         },
    //                                         separator: 15,
    //                                         heightSizedBox: 180),
    //                                   ],
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(height: 28.h),
    //                     GeneralListHorizontalCard(
    //                         list: NewsList,
    //                         scrollDirection: Axis.vertical,
    //                         physics: const NeverScrollableScrollPhysics(),
    //                         title: 'News',
    //                         apiCallStatus: false,
    //                         itemBuilder: (BuildContext, index) {
    //                           var list = NewsList[index];
    //                           return CarNewsCard(news: list);
    //                         },
    //                         separator: 15,
    //                         heightSizedBox:
    //                             calculateListHeight(NewsList, 116, 15)),
    //                     GeneralListHorizontalCard(
    //                         list: VideoList,
    //                         title: 'Video',
    //                         apiCallStatus: false,
    //                         itemBuilder: (BuildContext, index) {
    //                           var list = VideoList[index];
    //                           return CarVideoCard(video: list);
    //                         },
    //                         separator: 15,
    //                         heightSizedBox: 171),
    //                   ],
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ))
    //     ],
    //   ),
    // );
    return Container();

  }
}
