import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:get/get.dart';

const onSurfaceTextColor = Colors.white;
TextStyle headerText = TextStyle(
  color: Get.isDarkMode ? onSurfaceTextColor : headerTextLightColor,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
TextStyle subHeaderText = TextStyle(
  color: Get.isDarkMode ? onSurfaceTextColor : Colors.grey.withOpacity(0.7),
  fontSize: 16,
  fontWeight: FontWeight.w300,
);
TextStyle subTitleGetStyle = TextStyle(
  color: Get.isDarkMode ? onSurfaceTextColor : Colors.black,
  fontWeight: FontWeight.w300,
  fontSize: 12,
  height: 1.6,
);

Widget userInfoScreenTitle(String label,TextStyle? textStyle){
  return  Text(
    label,
    style:textStyle,
  );
}
