import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/custom_styles.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    required this.logo,
    required this.name,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String logo;
  final String name;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145.w,
        height: 185.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: const Color(0xFF5A6CEA).withOpacity(0.02),
              offset: const Offset(10, 10),
              spreadRadius: 20,
            ),
            BoxShadow(
              blurRadius: 20,
              color: const Color(0xFF5A6CEA).withOpacity(0.02),
              offset: const Offset(-10, -10),
              spreadRadius: 20,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              logo,
              height: 75.h,
            ),
             SizedBox(
              height: 15.h,
            ),
            Text(
              name,
              style: headerText.copyWith(fontSize: 16.sp),
            ),
             SizedBox(
              height: 5.h,
            ),
            Text(
              '10 Mins',
              style: subHeaderText.copyWith(
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}