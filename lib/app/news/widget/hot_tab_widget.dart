import 'package:carstore/app/news/controllers/news_controller.dart';
import 'package:carstore/app/news/model/review_news.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/calculate_list_height.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HotTapWidget extends GetView<NewsController> {
  const HotTapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<ReviewNews> reviewList = [
      ReviewNews(
          id: 1,
          news: 'Ha98ufhilshfukgdj',
          image: AppIcons.pic,
          author: 'Hazmza Amassi',
          countLike: 100,
          countReply: 18,
          createdPublish: '3',
          isLike: true),
      ReviewNews(
          id: 2,
          news: 'rekjuiot.,mvjdbf',
          image: AppIcons.carPic,
          author: 'Mohammed m,fksdjuh',
          countLike: 80,
          countReply: 29,
          createdPublish: '8',
          isLike: false),
      ReviewNews(
          id: 3,
          news: 'Ha98ufhilshfukgdj',
          image: AppIcons.placeHolder,
          author: 'Salha masoud',
          countLike: 150,
          countReply: 68,
          createdPublish: '5',
          isLike: true),
      ReviewNews(
          id: 4,
          news: 'Ha98ufhilshfukgdj',
          image: AppIcons.placeHolder,
          author: 'Hazmza Amassi',
          countLike: 100,
          countReply: 18,
          createdPublish: '3',
          isLike: true),
      ReviewNews(
          id: 5,
          news: 'Ha98ufhilshfukgdj',
          image: AppIcons.pic,
          author: 'Hazmza Amassi',
          countLike: 100,
          countReply: 18,
          createdPublish: '3',
          isLike: false),
      ReviewNews(
          id: 6,
          news: 'Ha98ufhilshfukgdj',
          image: AppIcons.pic,
          author: 'Hazmza Amassi',
          countLike: 100,
          countReply: 18,
          createdPublish: '3',
          isLike: false),
    ].obs;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          GeneralListHorizontalCard(
            list: reviewList,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            showMoreText: null,
            itemBuilder: (context, index) {
              var list = reviewList[index];
              return ReviewCard(
                reviews: list,
              );
            },
            separator: 15,
            heightSizedBox: calculateListHeight(reviewList,100,15),
          )
        ],
      ),
    );
  }

}
