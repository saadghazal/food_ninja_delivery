import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:get/get.dart';


import '../themes/app_colors.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<AuthController>().signOut();
      },
      child: Container(
        height: 45.h,
        width: 45.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: Colors.grey.withOpacity(0.23),
              offset: const Offset(10, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(15.r),
          color: const Color(0xFFFAFDFF),
        ),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return buttonGradient.createShader(bounds);
          },
          child: const Icon(
            Icons.notifications_none_outlined,
            size: 27,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
