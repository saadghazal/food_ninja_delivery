import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_colors.dart';
import '../../themes/custom_styles.dart';

class MenuBarWidget extends StatelessWidget {
  const MenuBarWidget({
    required this.icon,
    required this.menuName,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String menuName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 105.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: menuBarActiveGradient,
        color: Colors.white.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return buttonGradient.createShader(bounds);
            },
            child: Icon(
              icon,
              color: Colors.white,
              size: 25.sp,
            ),
          ),
           SizedBox(
            width: 12.w,
          ),
          Text(
            menuName,
            style: headerText.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
