import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_colors.dart';
import '../../themes/custom_styles.dart';

class RateDistanceWidget extends StatelessWidget {
  const RateDistanceWidget({required this.isMeal,Key? key}) : super(key: key);
  final bool isMeal;

  @override
  Widget build(BuildContext context) {
    return isMeal?Row(
      children: [

        Icon(
          Icons.star_half_rounded,
          color: const Color(0xFF2ECF80),
          size: 28.sp,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '4,8 Rating',
          style: subHeaderText.copyWith(fontSize: 14.sp),
        ),
        SizedBox(
          width: 20.w,
        ),
        Icon(
          Icons.shopping_bag_outlined,
          color: const Color(0xFF2ECF80),
          size: 28.sp,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '2000+ Order',
          style: subHeaderText.copyWith(fontSize: 14.sp),
        ),
      ],
    ):Row(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return buttonGradient.createShader(rect);
          },
          child: Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 25.sp,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '19 Km',
          style: subHeaderText.copyWith(fontSize: 14.sp),
        ),
        SizedBox(
          width: 20.w,
        ),
        Icon(
          Icons.star_half_rounded,
          color: const Color(0xFF2ECF80),
          size: 28.sp,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          '4,8 Rating',
          style: subHeaderText.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }
}
