// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:carstore/app/news/model/news_list.dart';
import 'package:carstore/app/search/controllers/search_model_controller.dart';
import 'package:carstore/app/video/models/video_list.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/calculate_list_height.dart';
import 'package:carstore/widgets/car_news_card.dart';
import 'package:carstore/widgets/car_similar_card.dart';
import 'package:carstore/widgets/car_video_card.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class SearchModelPage extends GetView<SearchModelController> {
  const SearchModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchModelController());
    List list6 = [1, 2, 3, 4, 5, 6];
    List list4 = [1, 2, 3, 4];
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            child: getSearch(
              isSearch: true,
              size: 14,
              leadingIcon: AppIcons.backtrackIcon,
              leadingColor: LightThemeColors.dividerColor,
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80.w,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://www.peruzzimazda.com/blogs/2313/wp-content/uploads/2019/10/2018_MazdaLogo_NEW_black.png")),
                    color: LightThemeColors.backgroundColor,
                  ),
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mazda",
                        style: TextStyle(
                            fontSize: MyFonts.sectionListTitle,
                            color: LightThemeColors.iconColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 6.h),
                    Text("Brand introduction",
                        style: TextStyle(
                            fontSize: MyFonts.headline6TextSize,
                            color: LightThemeColors.dividerColor)),
                    SizedBox(height: 13.h),
                    Text("\$456,800-\$486,800",
                        style: TextStyle(
                            fontSize: MyFonts.body2TextSize,
                            color: LightThemeColors.primaryColor))
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 20.h,
                  color: LightThemeColors.dividerColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25.r),
                          topLeft: Radius.circular(25.r)),
                      color: LightThemeColors.backgroundColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GeneralListHorizontalCard(
                              heightSizedBox: 68,
                              scrollDirection: Axis.horizontal,
                              separator: 10,
                              list: list4,
                              //4
                              itemBuilder: controller.bulidFirstItems,
                              showMoreText: null,
                            ),
                            SizedBox(height: 28.h),
                            GeneralListHorizontalCard(
                              title: 'Lexus LC price list',
                              showMoreText: 'All',
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              separator: 15,
                              list: list6,
                              itemBuilder: controller.bulidFiveItem,
                              heightSizedBox:
                                  calculateListHeight(list6, 70, 15),
                            ),
                            GeneralListHorizontalCard(
                              itemBuilder: (BuildContext, index) {
                                final newsList = NewsList[index];
                                return CarNewsCard(news: newsList);
                              },
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              title: 'News',
                              separator: 15,
                              list: NewsList,
                              heightSizedBox:
                                  calculateListHeight(NewsList, 93, 15),
                            ),
                            SizedBox(height: 28.h),
                            GeneralListHorizontalCard(
                              title: 'Videos',
                              heightSizedBox: 171,
                              separator: 15,
                              list: VideoList,
                              itemBuilder:(BuildContext,index){
                                var list = VideoList[index];
                                return CarVideoCard(video: list,);
                              },
                            ),
                            // GeneralListHorizontalCard(
                            //   heightSizedBox: 226,
                            //   title: 'Similar Cars',
                            //   showMoreText: '',
                            //   separator: 15,
                            //   list: ListCar,
                            //   itemBuilder: (context, index) {
                            //     final car = ListCar[index];
                            //     return CarSimilarCard(
                            //       car: car,
                            //       color:
                            //           LightThemeColors.scaffoldBackgroundColor,
                            //     );
                            //   },
                            // ),
                            SizedBox(height: 44.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
