import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/cart_controller.dart';
import 'package:food_delivery_green/models/restaurant_models/rest_meals_model.dart';
import 'package:food_delivery_green/refs/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../themes/app_colors.dart';
import '../../themes/custom_styles.dart';
import '../../themes/ui_utils.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    required this.meal,
    required this.index,
    this.isFavorite=false,
    Key? key,
  }) : super(key: key);
  final RestMeals meal;
  final int index;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return isFavorite?favoriteOrderItem(meal: meal): Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        height: 100.h,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: dismissibleColor,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete_outline,
            color: Colors.white,
            size: 28.sp,
          ),
        ),
      ),
      onDismissed: (direction) async {
        await Get.find<CartController>().deleteCartItem(meal);
        snackBarFeedback(context, 'Item deleted.');
      },
      child: Container(
        height: 100.h,
        width: double.maxFinite,
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: Colors.white,
          boxShadow: containerShadow(),
        ),
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(
                    meal.mealImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.mealName,
                    style: headerText.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    meal.category,
                    style: subHeaderText.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ShaderMask(
                    shaderCallback: (rect) {
                      return buttonGradient.createShader(rect);
                    },
                    child: Text(
                      '\$ ${meal.mealPrice}',
                      style: headerText.copyWith(
                        fontSize: 19.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.find<CartController>().decrementItemQuantity(meal);
                    },
                    child: Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: greenColor1.withOpacity(0.1),
                      ),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return buttonGradient.createShader(rect);
                        },
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    meal.quantity.toString(),
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF181818),
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.find<CartController>().incrementItemQuantity(meal);
                    },
                    child: Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        gradient: buttonGradient,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget favoriteOrderItem({required RestMeals meal}) {
  return Container(
    height: 105.h,
    width: double.maxFinite,
    padding: EdgeInsets.only(
      left: 10.w,
      right: 10.w,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22.r),
      color: Colors.white,
      boxShadow: containerShadow(),
    ),
    child: Row(
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: NetworkImage(
                meal.mealImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal.mealName,
                style: headerText.copyWith(
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                meal.category,
                style: subHeaderText.copyWith(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return buttonGradient.createShader(rect);
                },
                child: Text(
                  '\$ ${meal.mealPrice}',
                  style: headerText.copyWith(
                    fontSize: 19.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Container(
            height: 30.h,
            width: 85.w,
            decoration: BoxDecoration(
              gradient: buttonGradient,
              borderRadius: BorderRadius.circular(17.5.r),
            ),
            child: Center(
              child: Text(
                'Buy Again',
                style: headerText.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
