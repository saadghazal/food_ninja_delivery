import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';

import '../../themes/app_colors.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    required this.onTap,
    required this.iconHeight,
    this.borderRadius = 20,
    required this.icon,
    this.text = '',
    this.height = 75,
    this.showText,
    Key? key,
  }) : super(key: key);
  final double iconHeight;
  final String icon;
  final String? text;
  final bool? showText;
  final double? height;
  final double? borderRadius;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        // width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius!),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.09),
              blurRadius: 30,
              spreadRadius: 0,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Center(
          child: showText!
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      icon,
                      height: iconHeight,
                    ),
                     SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      text!,
                      style: headerText.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                )
              : Image.asset(
                  icon,
                  height: iconHeight,
                ),
        ),
      ),
    );
  }
}
