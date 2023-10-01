import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/cart_controller.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:food_delivery_green/themes/ui_utils.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_icon.dart';
import 'package:food_delivery_green/widgets/order_widgets/order_item_widget.dart';
import 'package:food_delivery_green/widgets/order_widgets/place_order_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../themes/app_colors.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/order-details';

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getTotalPrice();
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                Get.isDarkMode
                    ? 'assets/images/Patterndark.png'
                    : 'assets/images/pattern2.png',
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: MainIcon(
                      borderRadius: 15.r,
                      width: 45.w,
                      height: 45.h,
                      backgroundColor: mainIconColor.withOpacity(0.1),
                      onTap: () {
                        Get.back();
                      },
                      icon: Icons.arrow_back_ios_new_outlined,
                      iconColor: mainIconColor,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Text(
                      'Order Details',
                      style: headerText,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SizedBox(
                      height: 420.h,
                      child: GetBuilder<CartController>(
                        id: 'order_item',
                        builder: (cart) {
                          final cartItems = cart.cartItems;
                          if (cartItems.isEmpty) {
                            return const Center(
                              child: Text('There are no items to order'),
                            );
                          }
                          return ListView.separated(
                            itemBuilder: (context, index) => OrderItemWidget(
                              meal: cartItems[index],
                              index: index,
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20.h,
                            ),
                            itemCount: cartItems.length,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Obx(() {
                return PlaceOrderWidget(
                  totalPrice: Get.find<CartController>().totalPrice.value,
                  totalDiscount: Get.find<CartController>().totalDiscount.value,
                  totalItemsPrice: Get.find<CartController>().totalItemsPrice.value,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
