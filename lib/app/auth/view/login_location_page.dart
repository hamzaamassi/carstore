import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:carstore/core/config/translations/strings_enum.dart';
import 'package:carstore/app/auth/controller/login_location_controller.dart';
import 'package:carstore/routes/app_pages.dart';
import 'package:carstore/utils/app_icons.dart';
import 'package:carstore/widgets/alphabet_scroll_view_country.dart';
import 'package:carstore/widgets/general_list_horizontal_card.dart';
import 'package:carstore/widgets/general_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginLocationPage extends StatelessWidget {
  const LoginLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = ['New Yourk','Bankok', 'Rome'].obs;
    final LoginLocationController controller =
        Get.put(LoginLocationController());
    final TextEditingController searchController = TextEditingController();
    ever(controller.searchQuery, (_) {
      if (searchController.text != controller.searchQuery.value) {
        searchController.text = controller.searchQuery.value;
      }
    });
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
              child: getSearch(
                leadingIcon: AppIcons.closeIcon,
                leadingOnTap: () => {},
                isSearch: true,
                size: 10,
                onChange: (query) {
                  controller.searchProducts(query);
                },
              ),
            ),
            SizedBox(height: 34.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    Strings.selected.tr,
                    style: TextStyle(fontSize: MyFonts.body2TextSize),
                  ),
                  Obx(
                    () => Text(
                      controller.name.value,
                      style: TextStyle(
                          fontSize: MyFonts.appBarTittleSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            SingleChildScrollView(
              child: Container(
                width: double.infinity.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18.h),
                      Opacity(
                        opacity: .8,
                        child: Text(
                          "City location",
                          style: TextStyle(fontSize: MyFonts.body2TextSize),
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.location),
                              SizedBox(width: 10.w),
                              Obx(() => Text(
                                    controller.name.value,
                                    style: TextStyle(
                                        fontSize: MyFonts.body1TextSize,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Get.offAndToNamed(Routes.appBottomBar),
                            child: Text(
                              Strings.detect.tr,
                              style: TextStyle(
                                  color: LightThemeColors.primaryColor,
                                  fontSize: MyFonts.body2TextSize),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 22.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Opacity(
                            opacity: .8,
                            child: Text(
                              Strings.hotCity.tr,
                              style: TextStyle(fontSize: MyFonts.body2TextSize),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          GeneralListHorizontalCard(
                              list: list,
                              showMoreText: null,
                              itemBuilder: (BuildContext,index)=>Container(
                                height: 28.h,
                                width: 73.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                    color: LightThemeColors.scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Text(
                                  list[index],
                                  style: TextStyle(
                                      fontSize: MyFonts.body1TextSize,
                                      color: LightThemeColors.iconColor),
                                ),
                              ),
                              separator: 15,
                              heightSizedBox: 28)
                        ],
                      ),
                      SizedBox(
                        height: 448.h,
                        width: double.infinity.w,
                        child: AlphabetScrollViewCountry(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
