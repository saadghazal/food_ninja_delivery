import 'package:flutter/material.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/screens/home_screens/home_screen.dart';
import 'package:food_delivery_green/screens/home_screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_button.dart';

import '../../../themes/custom_styles.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);
  static const routeName = '/done';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/Pattern.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/done.png',
                  height: 150.h,
                ),
                SizedBox(
                  height: 35.h,
                ),
                ShaderMask(
                  shaderCallback: (rect) {
                    return buttonGradient.createShader(rect);
                  },
                  child: Text(
                    'Congrats!',
                    style: headerText.copyWith(
                      color: Colors.white,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Your Profile Is Ready To Use!',
                  style: headerText.copyWith(
                    fontSize: 23.sp,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MainButton(
                  height: 57.h,
                  width: 157.w,
                  borderRadius: 15.r,
                  textColor: Colors.white,
                  onTap: () async{
                  await  Get.find<AuthController>().getUserData();
                    Get.offAllNamed(HomeScreen.routeName);
                  },
                  text: 'Try Order',
                  isGradient: true,
                  fontSize: 16.sp,
                ),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
