import 'package:carstore/app/order/controllers/order_controller.dart';
import 'package:carstore/app/order/models/order.dart';
import 'package:carstore/core/config/theme/light_theme_colors.dart';
import 'package:carstore/core/config/theme/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderItemCard extends StatefulWidget {
  const OrderItemCard({super.key, required this.order});

  final Order order;

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  void incrementQuantity() {
    if (widget.order.quantity < 10) {
      setState(() {
        widget.order.quantity++;
        // Call the updateQuantity method from the OrderController
        Get.find<OrderController>()
            .updateQuantity(widget.order, widget.order.quantity);
        Get.find<OrderController>().updateTotalValues();
      });
    }
  }

  void decrementQuantity() {
    if (widget.order.quantity > 1) {
      setState(() {
        widget.order.quantity--;
        // Call the updateQuantity method from the OrderController
        Get.find<OrderController>()
            .updateQuantity(widget.order, widget.order.quantity);
        Get.find<OrderController>().updateTotalValues();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: LightThemeColors.scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          Image.asset(
            widget.order.image,
            width: 80.w,
            height: 80.w,
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.order.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MyFonts.body2TextSize,
                      color: LightThemeColors.iconColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 25.h,
                      width: 72.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: LightThemeColors.backgroundColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: decrementQuantity,
                            child: const Icon(
                              Icons.remove,
                              size: 12,
                            ),
                          ),
                          Text(
                            widget.order.quantity.toString(),
                            style: TextStyle(
                                fontSize: MyFonts.body2TextSize,
                                color: LightThemeColors.iconColor),
                          ),
                          GestureDetector(
                            onTap: incrementQuantity,
                            child: const Icon(
                              Icons.add,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${widget.order.price * widget.order.quantity}',
                      style: TextStyle(
                          fontSize: MyFonts.body2TextSize,
                          color: LightThemeColors.primaryColor),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
