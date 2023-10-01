import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_in_screen.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:get/get.dart';


import '../../widgets/main_widgets/main_button.dart';

class SecondGetScreen extends StatelessWidget {
  const SecondGetScreen({Key? key}) : super(key: key);
  static const routeName = '/second-get';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            SizedBox(
              height: 52.h,
            ),
              SizedBox(
                width: double.maxFinite,

                child: Image.asset(
                  Get.isDarkMode
                      ? 'assets/images/get_started2_dark.png'
                      : 'assets/images/get_started2.png',
                  fit: BoxFit.cover,
                ),
              ),
            Center(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      width: 348.w ,
                      height: 130.h,
                      child: Column(
                        children: [
                          Text(
                            'Food Ninja is Where Your\nComfort Food Lives',
                            textAlign: TextAlign.center,
                            style: headerText.copyWith(
                              fontSize: 22.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h ,
                          ),
                          Text(
                            'Enjoy a fast and smooth food delivery at\nyour doorstep',
                            textAlign: TextAlign.center,
                            style: subTitleGetStyle.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 42.h ,
                    ),
                    MainButton(
                      borderRadius: 15.r,
                      width: 157.w,
                      height: 57.h,
                      onTap: () {
                        Get.offAllNamed(SignInScreen.routeName);
                      },
                      text: 'Next',
                      isGradient: true,
                      textColor: Colors.white,
                      fontSize: 16.sp,
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
