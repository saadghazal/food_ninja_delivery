import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/restaurants_controller.dart';
import 'package:food_delivery_green/models/restaurant_models/restaurant_model.dart';
import 'package:food_delivery_green/screens/restScreens/meal_screen.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:food_delivery_green/themes/ui_utils.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_icon.dart';
import 'package:food_delivery_green/widgets/meal_and_restaurant_widgets/popular_row_widget.dart';
import 'package:food_delivery_green/widgets/meal_and_restaurant_widgets/rate_distance_widget.dart';
import 'package:food_delivery_green/widgets/meal_and_restaurant_widgets/rating_card_widget.dart';
import 'package:food_delivery_green/widgets/meal_and_restaurant_widgets/restaurant_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/restaurant_models/rest_meals_model.dart';
import '../../themes/app_colors.dart';
import '../../widgets/main_widgets/meal_widget.dart';
import '../../widgets/main_widgets/view_more_widget.dart';

class RestaurantScreen extends StatelessWidget {
  RestaurantScreen({
    this.restName = '',
    this.restBranch = '',
    required this.restMeals ,
    Key? key,
  }) : super(key: key);
  static const routeName = '/rest';
  String restName;
  String restBranch;
  List<RestMeals> restMeals;
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
                restBranch,
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
                          borderRadius: BorderRadius.circular(50.r),),
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
                            child: restaurantDetails(restName),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: ViewMore(
                              onTap: () {},
                              functionalityName: 'Restaurant Menu',
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          restaurantMealsList(restMeals),
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
          ],
        ),
      ),
    );
  }
}

Widget restaurantMealsList(List<RestMeals> meals) {
  return SizedBox(
    height: 170.h,
    child: ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: MealWidget(
          mealPhoto: meals[index].mealImage,
          mealName: meals[index].mealName,
          mealPrice: meals[index].mealPrice,
          onTap: ()  {
             Get.to(
              () => MealScreen(
                meal: meals[index],
              ),
              transition: Transition.fadeIn,
            );

          },
        ),
      ),
      itemCount: meals.length,
    ),
  );
}

Widget restaurantDetails(String restName) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        restName,
        style: headerText.copyWith(
          fontSize: 27.sp,
        ),
      ),
      SizedBox(
        height: 20.h,
      ),
      const RateDistanceWidget(isMeal: false),
      SizedBox(
        height: 20.h,
      ),
      Text(
        'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
        style: subHeaderText.copyWith(
          fontSize: 12.h,
          height: 1.8,
          color: headerTextLightColor,
        ),
      ),
    ],
  );
}
