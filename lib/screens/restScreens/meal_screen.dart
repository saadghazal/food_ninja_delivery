import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/cart_controller.dart';
import 'package:food_delivery_green/models/restaurant_models/rest_meals_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../refs/constants.dart';
import '../../themes/app_colors.dart';
import '../../themes/custom_styles.dart';
import '../../widgets/main_widgets/main_icon.dart';
import '../../widgets/meal_and_restaurant_widgets/popular_row_widget.dart';
import '../../widgets/meal_and_restaurant_widgets/rate_distance_widget.dart';
import '../../widgets/meal_and_restaurant_widgets/rating_card_widget.dart';
import '../../widgets/main_widgets/view_more_widget.dart';

class MealScreen extends StatelessWidget {
  MealScreen({
    required this.meal,
    Key? key,
  }) : super(key: key);
  final RestMeals? meal;

  static const routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(
          children: [
            SizedBox(
              height: 400.h,
              width: double.maxFinite,
              child: Image.network(
                meal!.mealImage,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: MainIcon(
                  borderRadius: 15.r,
                  width: 45.w,
                  height: 45.h,
                  backgroundColor: greenColor1.withOpacity(0.5),
                  onTap: () {
                    Get.back();
                  },
                  icon: Icons.arrow_back_ios_new_outlined,
                  iconColor: Colors.white,
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 0.85,
              minChildSize: 0.6,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.r),
                      topLeft: Radius.circular(50.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 18.h,
                              ),
                              child: Container(
                                height: 5.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: const Color(0xFFFEF6ED),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w),
                            child: const PopularRowWidget(),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w),
                            child: mealDetails(
                              meal!.mealName,
                              meal!.mealDescription,
                              meal!.mealPrice,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Text(
                              'Testimonials',
                              style: headerText.copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 500.h,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) =>
                                  RatingCardWidget(),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20.h,
                              ),
                              itemCount: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: GetBuilder<CartController>(
                  id: 'existFlag',
                  builder: (cart) {
                    return InkWell(
                      onTap: () {
                        cart.addCartItem(meal!);

                        if (cart.existingFlag!) {
                          snackBarFeedback(
                              context, 'Item is already in the cart');
                        } else {
                          snackBarFeedback(context, 'Item added to the cart');
                        }
                      },
                      child: Container(
                        height: 60.h,
                        margin: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 20.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: buttonGradient,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              color: greenColor1.withOpacity(0.4),
                              blurRadius: 30,
                              spreadRadius: 0,
                              offset: const Offset(0, 20),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add To Cart',
                              style: headerText.copyWith(
                                  color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 22.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget mealDetails(String mealName, String mealDetails, double mealPrice) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Text(
              mealName,
              style: headerText.copyWith(
                fontSize: 27.sp,
              ),
            ),
          ),
          Text(
            '\$$mealPrice',
            style: headerText.copyWith(
              fontSize: 27.sp,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20.h,
      ),
      const RateDistanceWidget(isMeal: true),
      SizedBox(
        height: 20.h,
      ),
      Text(
        mealDetails,
        style: subHeaderText.copyWith(
          fontSize: 12.h,
          height: 1.8,
          color: headerTextLightColor,
        ),
      ),
    ],
  );
}
