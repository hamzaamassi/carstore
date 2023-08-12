import 'package:carstore_car/app/order/models/order.dart';
import 'package:carstore_car/core/config/theme/light_theme_colors.dart';
import 'package:carstore_car/routes/app_pages.dart';
import 'package:carstore_car/utils/app_icons.dart';
import 'package:carstore_car/widgets/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  String orderTime = '7:15 pm';
  String deliveryTime = '18:00 pm';
  RxBool isPay = false.obs;
  double totalDiscount = 0.0;
  double totalPriceAfterDiscount = 0.0;

  // List to store the orders
  List<Order> order = [
    Order(
      name: 'Orion Motor Wheel Spacers',
      quantity: 1,
      image: AppIcons.p718,
      price: 627,
      discount: 18,
    ),
    Order(
      name: 'Child-Seat-Cover',
      quantity: 1,
      image: AppIcons.carPic,
      price: 68,
      discount: 5,
    ),
    Order(
      name: 'car-covers',
      quantity: 1,
      image: AppIcons.placeHolder,
      price: 700,
      discount: 27,
    ),
    // Add more orders as needed
  ].obs;

  void updateTotalValues() {
    totalDiscount = 0.0;
    totalPriceAfterDiscount = 0.0;

    for (var orderItem in order) {
      orderItem.totalAfterDiscount = orderItem.price * orderItem.quantity - orderItem.discount;
      totalDiscount += orderItem.discount;
      totalPriceAfterDiscount += orderItem.totalAfterDiscount;
    }
  }

  // Method to update the quantity of an order item
  void updateQuantity(Order item, int newQuantity) {
    item.quantity = newQuantity;
    updateTotalValues();
  }

  // Method to update the price of an order item
  void updatePrice(Order item, double newPrice) {
    item.price = newPrice;
    updateTotalValues();
  }

  // Method to update isPay value
  void updateIsPay(bool newValue) {
    isPay.value = newValue;
  }

  @override
  void onInit() {
    // Calculate the total values when the controller is initialized
    updateTotalValues();
    super.onInit();
  }

  Widget buildContainer() {
    return Container(
      height: 310.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: LightThemeColors.scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Discound'), Text('\$$totalDiscount')],
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Total'), Text('\$$totalPriceAfterDiscount')],
          ),
          SizedBox(height: 58.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Order time'), Text(orderTime)],
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('expected delivery time'),
              Text(deliveryTime)
            ],
          ),
          SizedBox(height: 35.h),
          CustomPrimaryButton(
            text: 'Pay Now',
            onTap: () => {isPay.value = true},
          ),
        ],
      ),
    );
  }

  Widget buildDisplayContainer() {
    return GestureDetector(
      onTap: () {
        isPay.value =
            false; // Set isPay to false when tapping outside the container
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                isPay.value =
                    true; // Set isPay to false when tapping outside the container
              },
              child: Container(
                height: 384.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: LightThemeColors.backgroundColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('Discound'), Text('\$$totalDiscount')],
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('Total'), Text('\$$totalPriceAfterDiscount')],
                    ),
                    SizedBox(height: 38.h),
                    const Text('Address'),
                    SizedBox(height: 13.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            '6360 Sunset Blvd, Los Angeles,CA 90028 United States'),
                        GestureDetector(
                          child: const Text('Edit'),
                          onTap: () => {},
                        )
                      ],
                    ),
                    SizedBox(height: 28.h),
                    const Text('Paymnet'),
                    SizedBox(height: 13.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                            '6360 Sunset Blvd, Los Angeles,CA 90028 United States'),
                        GestureDetector(
                          child: const Icon(Icons.keyboard_arrow_down),
                          onTap: () => {},
                        )
                      ],
                    ),
                    SizedBox(height: 44.5.h),
                    CustomPrimaryButton(
                      text: 'Pay Now',
                      onTap: () => {Get.toNamed(Routes.appBottomBar)},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
