import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/screens/get_started_screens/second_get_started.dart';
import 'package:get/get.dart';


import '../../themes/custom_styles.dart';
import '../../widgets/main_widgets/main_button.dart';

class FirstGetScreen extends StatelessWidget {
  FirstGetScreen({Key? key}) : super(key: key);

  static const routeName = '/get-started';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            SizedBox(
              width: double.maxFinite,
              child: Image.asset(
                Get.isDarkMode
                    ? 'assets/images/get_started1_dark.png'
                    : 'assets/images/get_started1.png',
                fit: BoxFit.cover,
              ),
            ),
             SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      width: 245.w,
                      height: 130.h,
                      child: Column(
                        children: [
                          Text(
                            'Find your Comfort Food here',
                            textAlign: TextAlign.center,
                            style: headerText.copyWith(
                              fontSize: 22.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Here You Can find a chef or dish for every taste and color. Enjoy!',
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
                      width: 157.w ,
                      height: 57.h ,
                      onTap: () {
                        Get.toNamed(
                          SecondGetScreen.routeName,
                        );
                      },
                      text: 'Next',
                      isGradient: true,
                      textColor: Colors.white,
                      fontSize: 16.sp,
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
