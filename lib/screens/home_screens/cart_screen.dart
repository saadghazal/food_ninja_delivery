import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/cart_controller.dart';
import 'package:food_delivery_green/controllers/restaurants_controller.dart';
import 'package:food_delivery_green/screens/order_screens/order_details_screen.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_button.dart';
import 'package:food_delivery_green/widgets/meal_and_restaurant_widgets/popular_meal_widget.dart';
import 'package:food_delivery_green/widgets/meal_and_restaurant_widgets/restaurant_widget.dart';
import 'package:get/get.dart';

import '../../themes/custom_styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0.w,
          child: Image.asset(
            Get.isDarkMode
                ? 'assets/images/Patterndark.png'
                : 'assets/images/pattern2.png',
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Cart',
                    style: headerText.copyWith(
                      fontSize: 30.sp,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cart Items',
                        style: headerText.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      checkOrder(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 500.h,
                    width: double.maxFinite,
                    child: GetBuilder<CartController>(
                        id: 'cart_item',
                        builder: (cart) {
                          final cartItems = cart.cartItems;
                          if (cartItems.isEmpty) {
                            return const Center(
                              child: Text('No items added to cart yet'),
                            );
                          } else {
                            return ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                return PopularMeal(
                                  name: cartItems[index].mealName,
                                  image: cartItems[index].mealImage,
                                  price: cartItems[index].mealPrice,
                                );
                              },
                              itemCount: cartItems.length,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20.h,
                              ),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget checkOrder() {
  return GestureDetector(
    onTap: () {
      Get.toNamed(OrderDetailsScreen.routeName);
    },
    child: Container(
      height: 40.h,
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: greenColor1.withOpacity(0.09),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: ShaderMask(
          shaderCallback: (rect) {
            return buttonGradient.createShader(rect);
          },
          child: Text(
            'Check Order',
            style: headerText.copyWith(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}
