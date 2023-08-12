// ignore_for_file: unused_element

import 'package:e_commerce_car/core/config/theme/light_theme_colors.dart';
import 'package:e_commerce_car/models/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer {
  static Widget basicShimmer({
    double height = double.infinity,
    double width = double.infinity,
    double radius = 6,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: LightThemeColors.shimmerHighlighted,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecorations.buildDefaultBoxDecoration(radius: radius),
      ),
    );
  }

  static Widget _buildBasicShimmerCustomRadius({
    double height = double.infinity,
    double width = double.infinity,
    BorderRadius radius = BorderRadius.zero,
    Color color = Colors.grey,
  }) {
    return Shimmer.fromColors(
      baseColor: color,
      highlightColor: LightThemeColors.shimmerHighlighted,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: LightThemeColors.shimmerBase,
        ),
      ),
    );
  }

  static Widget buildListShimmer({
    double itemHeight = 100.0,
    int itemCount = 10,
    Widget? shimmerListItem,
  }) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: 0.0.h,
            left: 16.0.w,
            right: 16.0.w,
            bottom: 16.0.h,
          ),
          child: shimmerListItem ?? AppShimmer.basicShimmer(height: itemHeight),
        );
      },
    );
  }

  static Widget buildSquareGridShimmer({
    ScrollController? controller,
    double itemHeight = 120.0,
    itemCount = 10,
  }) {
    return GridView.builder(
      itemCount: itemCount,
      controller: controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 2 / 3,
      ),
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: LightThemeColors.shimmerBase,
            highlightColor: LightThemeColors.shimmerHighlighted,
            child: Container(
              height: itemHeight,
              width: double.infinity,
              decoration: BoxDecorations.buildDefaultBoxDecoration(),
            ),
          ),
        );
      },
    );
  }

  static Widget buildHorizontalGridShimmerWithAxisCount({
    double itemHeight = 120.0,
    itemCount = 10,
    int crossAxisCount = 2,
    crossAxisSpacing = 10.0,
    mainAxisSpacing = 10.0,
    mainAxisExtent = 100.0,
    controller,
  }) {
    return GridView.builder(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: 10,
          mainAxisExtent: mainAxisExtent,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: LightThemeColors.shimmerBase,
            highlightColor: LightThemeColors.shimmerHighlighted,
            child: Container(
              height: itemHeight,
              width: double.infinity,
              decoration: BoxDecorations.buildDefaultBoxDecoration(),
            ),
          );
        });
  }

  static Widget buildSeparatedHorizontalListShimmer({
    double separationWidth = 16.0,
    double itemHeight = 110,
    int itemCount = 10,
  }) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index) => SizedBox(
        width: separationWidth.w,
      ),
      primary: false,
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: LightThemeColors.shimmerBase,
          highlightColor: LightThemeColors.shimmerHighlighted,
          child: Container(
            height: itemHeight,
            width: double.infinity,
            decoration: BoxDecorations.buildDefaultBoxDecoration(),
          ),
        );
      },
    );
  }
}
