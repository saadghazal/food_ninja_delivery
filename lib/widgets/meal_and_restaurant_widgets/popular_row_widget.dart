import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/restScreens/restaurant_screen.dart';
import '../../themes/app_colors.dart';

class PopularRowWidget extends StatelessWidget {
  const PopularRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        popularAndLocationWidget(height: 35, width: 75, isText: true),
        const Expanded(
          child: SizedBox(),
        ),
        popularAndLocationWidget(height: 35, width: 35, isText: false),
        SizedBox(
          width: 10.w,
        ),
        Container(
          height: 35.h,
          width: 35.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFFF1D1D).withOpacity(0.1),
          ),
          child: Center(
            child: Icon(
              Icons.favorite,
              color: const Color(0xFFFF1D1D),
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
Widget popularAndLocationWidget({
  required double height,
  required double width,
  required bool isText,
}) {
  return Container(
    height: height.h,
    width: width.w,
    decoration: BoxDecoration(
      shape: isText == false ? BoxShape.circle : BoxShape.rectangle,
      color: greenColor1.withOpacity(0.1),
      borderRadius: isText ? BorderRadius.circular(18.r) : null,
    ),
    child: Center(
      child: ShaderMask(
        shaderCallback: (rect) {
          return buttonGradient.createShader(rect);
        },
        child: isText
            ? Text(
          'Popular',
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        )
            : Icon(
          Icons.location_on_rounded,
          color: Colors.white,
          size: 20.sp,
        ),
      ),
    ),
  );
}