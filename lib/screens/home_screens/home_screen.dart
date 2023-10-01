import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/controllers/restaurants_controller.dart';
import 'package:food_delivery_green/screens/restScreens/restaurant_screen.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_icon.dart';
import 'package:food_delivery_green/widgets/meal_and_restaurant_widgets/popular_meal_widget.dart';
import 'package:food_delivery_green/widgets/meal_and_restaurant_widgets/restaurant_widget.dart';
import 'package:food_delivery_green/widgets/main_widgets/view_more_widget.dart';
import 'package:food_delivery_green/widgets/notification_icon.dart';
import 'package:food_delivery_green/widgets/offer_widget.dart';
import 'package:food_delivery_green/widgets/search_bar_widget.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../restScreens/meal_screen.dart';

class HomeScreen extends GetView<RestaurantsController> {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final user = Get.find<AuthController>().signedUser;
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
          child: SingleChildScrollView(
            physics: PageScrollPhysics(),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Find Your\nFavorite Food',
                        style: headerText.copyWith(
                          fontSize: 30.sp,
                        ),
                      ),
                      const NotificationIcon(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SearchBarWidget(),
                      SizedBox(
                        width: 10.w,
                      ),
                      MainIcon(
                        width: 50.w,
                        height: 50.h,
                        backgroundColor: mainInkColor.withOpacity(0.1),
                        onTap: () {},
                        iconImage: 'assets/images/Filter.png',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        width: double.maxFinite,
                        height: 150.h,
                        decoration: BoxDecoration(
                          gradient: buttonGradient,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: const OfferWidget(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ViewMore(
                          onTap: () {},
                          functionalityName: 'Nearest Restaurant',
                        ),
                      ),
                      Obx(
                        () => controller.isLoading == true
                            ? LoadingAnimationWidget.inkDrop(
                                color: greenColor1,
                                size: 35.sp,
                              )
                            : Padding(
                                padding: EdgeInsets.only(left: 25.w),
                                child: SizedBox(
                                  height: 185.h,
                                  child: ListView.separated(
                                    padding: EdgeInsets.zero,
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        RestaurantWidget(
                                      onTap: () {
                                        Get.to(
                                          () => RestaurantScreen(
                                            restMeals: controller
                                                .restaurantsList[index]
                                                .restMeals!,
                                            restBranch: controller
                                                .restaurantsList[index]
                                                .restBranch,
                                            restName: controller
                                                .restaurantsList[index].restName,
                                          ),
                                          transition: Transition.fadeIn,
                                        );
                                      },
                                      logo: controller
                                          .restaurantsList[index].restLogo,
                                      name: controller
                                          .restaurantsList[index].restName,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 25.w,
                                    ),
                                    itemCount: controller.restaurantsList.length,
                                  ),
                                ),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ViewMore(
                          onTap: () {},
                          functionalityName: 'Popular Menu',
                        ),
                      ),
                      Obx(
                        () => controller.isLoading == true
                            ? SizedBox(
                                child: LoadingAnimationWidget.inkDrop(
                                  color: greenColor1,
                                  size: 35.sp,
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemBuilder: (
                                    BuildContext context,
                                    int index,
                                  ) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => MealScreen(
                                           meal: controller.popularMeals[index],
                                          ),
                                          transition: Transition.fadeIn,
                                        );
                                      },
                                      child: PopularMeal(
                                        name: controller
                                            .popularMeals[index].mealName,
                                        image: controller
                                            .popularMeals[index].mealImage,
                                        price: controller
                                            .popularMeals[index].mealPrice,

                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: controller.popularMeals.length,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
