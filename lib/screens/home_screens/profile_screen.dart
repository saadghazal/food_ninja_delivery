import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/controllers/restaurants_controller.dart';
import 'package:food_delivery_green/refs/firebase_refs.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:food_delivery_green/themes/ui_utils.dart';
import 'package:food_delivery_green/widgets/order_widgets/order_item_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Get.find<AuthController>().signedUser;
    return GetBuilder<AuthController>(
        id: 'user_profile',
        builder: (controller) {
          return Stack(
            children: [
              SizedBox(
                height: 320.h,
                width: double.maxFinite,
                child: Image.network(
                  '${user.userPhoto}.jpg',
                  fit: BoxFit.cover,
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 5.h,
                                  width: 60.w,
                                  margin: EdgeInsets.only(top: 18.5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: const Color(0xFFFEF6ED),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 35.h,
                                  width: 110.w,
                                  margin: EdgeInsets.only(left: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.5.r),
                                    color: memberGoldColor.withOpacity(0.1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Member Gold',
                                      style: headerText.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: memberGoldColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${user.firstName} ${user.lastName}',
                                          style: headerText.copyWith(
                                            fontSize: 27.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          '${user.email}',
                                          style: subHeaderText.copyWith(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ShaderMask(
                                      shaderCallback: (rect) {
                                        return buttonGradient
                                            .createShader(rect);
                                      },
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/edit_icon.png',
                                          color: Colors.white,
                                          height: 24.h,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                height: 65.h,
                                width: double.maxFinite,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22.r),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowColor.withOpacity(0.09),
                                      blurRadius: 30,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 20),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/voucher_icon.png',
                                      height: 40.h,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Text(
                                      'You Have 3 Vouchers',
                                      style: headerText.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  'Favorite',
                                  style: headerText.copyWith(
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              OrderItemWidget(
                                meal: Get.find<RestaurantsController>()
                                    .popularMeals[0],
                                index: 0,
                                isFavorite: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        });
  }
}
