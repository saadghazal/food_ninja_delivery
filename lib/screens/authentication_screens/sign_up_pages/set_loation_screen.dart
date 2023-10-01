import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/controllers/location_controller.dart';
import 'package:food_delivery_green/refs/constants.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_in_screen.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/done_screen.dart';
import 'package:food_delivery_green/screens/home_screens/home_screen.dart';
import 'package:food_delivery_green/screens/map_screen.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/custom_styles.dart';
import '../../../widgets/main_widgets/main_button.dart';
import '../../../widgets/main_widgets/main_icon.dart';

class SetLocationScreen extends GetView<LocationController> {
  const SetLocationScreen({Key? key}) : super(key: key);
  static const routName = '/location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFF),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            image: AssetImage(
              'assets/images/pattern2.png',
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainIcon(
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
                SizedBox(
                  height: 20.h,
                ),
                userInfoScreenTitle(
                  'Set Your Location',
                  headerText.copyWith(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                userInfoScreenTitle(
                  securityText,
                  Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w300,
                        height: 1.5.h,
                      ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: 10.w,
                    right: 10.w,
                    bottom: 10.h,
                  ),
                  height: 145.h,
                  width: double.maxFinite,
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/pinLogo.png',
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          GetBuilder<LocationController>(builder: (location) {
                            return Text(
                              location.yourLocation.isEmpty
                                  ? 'Your Location'
                                  : location.yourLocation,
                              style: headerText.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      InkWell(
                        onTap: () async {
                          await controller.getUserLocation();
                          Get.toNamed(
                            MapScreen.routName,
                            arguments: [
                              controller.userMarker,
                              controller.initialCameraPosition,
                            ],
                          );
                        },
                        child: Container(
                          height: 60,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Set Location',
                              style: headerText.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Obx(
                    () {
                      if (Get.find<AuthController>().isLoading.value) {
                        return LoadingAnimationWidget.inkDrop(
                          color: greenColor1,
                          size: 35.sp,
                        );
                      }
                      return MainButton(
                        textColor: Colors.white,
                        width: 157.h,
                        height: 57.h,
                        isGradient: true,
                        borderRadius: 15.r,
                        onTap: () async {
                          final userLocation =
                              Get.find<LocationController>().yourLocation;
                          if (userLocation.isEmpty) {
                            return;
                          }
                          Get.find<AuthController>().saveUserLocation(
                            userLocation:
                                Get.find<LocationController>().yourLocation,
                          );
                          await Get.find<AuthController>().sendUserData();

                          Get.toNamed(DoneScreen.routeName);

                        },
                        text: 'Next',
                        fontSize: 16.sp,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
