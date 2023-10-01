import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';
import '../themes/custom_styles.dart';

const String securityText='This data will be displayed in your account\nprofile for security';
void snackBarFeedback(BuildContext context,String respondMessage){

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height/1.25).h,left: 10.w,right: 10.w),
      duration: const Duration(
        seconds: 2,

      ),
      backgroundColor: Colors.white,
      content:
      ShaderMask(
        shaderCallback: (rect){
          return buttonGradient.createShader(rect);
        },
        child:  Text(
          respondMessage,
          style: headerText.copyWith(
            color: Colors.white,
            fontSize: 16.sp,
          ),
        ),
      ),
    ),
  );
}
