import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:get/get.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    Key? key,
    required this.label,
    this.icon,
    required this.controller,
    required this.registerFlag,
    required this.isBordered,
    this.borderRadius = 15,
  }) : super(key: key);
  final String label;
  final String? icon;
  final double? borderRadius;
  final TextEditingController controller;
  final bool registerFlag;
  final bool isBordered;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? TextFormField(
            textInputAction: label == 'Username' || label == 'Email'
                ? TextInputAction.next
                : TextInputAction.done,
            cursorColor: greenColor1,
            obscureText: label == 'Password' ? true : false,
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 14.sp,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                if (registerFlag) {
                  switch (label) {
                    case 'Username':
                      return 'Please Enter Your Username';
                    case 'Email':
                      return 'Please Enter Your Email';
                    case 'Password':
                      return 'Please Enter Your Password';
                  }
                } else {
                  switch (label) {
                    case 'Email':
                      return 'Please Enter Your Email';
                    case 'Password':
                      return 'Please Enter Your Password';
                  }
                }
              }
              if (registerFlag) {
                if (label == 'Email') {
                  if (!GetUtils.isEmail(value)) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                } else if (label == 'Password') {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                  if (value.length < 6) {
                    return 'At least 6 characters';
                  } else if (!regex.hasMatch(value)) {
                    return 'Your password should contain A-Z,a-z,!@#\$&%';
                  } else {
                    return null;
                  }
                }
              } else {
                if (label == 'Email') {
                  if (!GetUtils.isEmail(value)) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                }
              }
            },
            controller: controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Color(0xFF3B3B3B).withOpacity(0.3),
                fontSize: 14.sp,
              ),
              hintText: label,
              focusedBorder: isBordered
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: BorderSide(
                        color: Color(0xFF3B3B3B).withOpacity(0.1),
                        width: 0.5,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
              enabledBorder: isBordered
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: BorderSide(
                        color: Color(0xFF3B3B3B).withOpacity(0.1),
                        width: 0.5,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 19.h,
                horizontal: 20.w,
              ),
              prefixIcon: Image.asset(
                icon!,
                height: 30.h,
                width: 30.w,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          )
        : Center(
            child: TextFormField(
              cursorColor: greenColor1,
              obscureText: label == 'Password' ? true : false,
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 14.sp,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  if (registerFlag) {
                    switch (label) {
                      case 'Username':
                        return 'Please Enter Your Username';
                      case 'Email':
                        return 'Please Enter Your Email';
                      case 'Password':
                        return 'Please Enter Your Password';
                    }
                  } else {
                    switch (label) {
                      case 'Email':
                        return 'Please Enter Your Email';
                      case 'Password':
                        return 'Please Enter Your Password';
                    }
                  }
                }
                if (registerFlag) {
                  if (label == 'Email') {
                    if (!GetUtils.isEmail(value)) {
                      return 'Invalid Email';
                    } else {
                      return null;
                    }
                  } else if (label == 'Password') {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                    if (value.length < 6) {
                      return 'At least 6 characters';
                    } else if (!regex.hasMatch(value)) {
                      return 'Your password should has upper and lower case,numbers and special characters';
                    } else {
                      return null;
                    }
                  }
                } else {
                  if (label == 'Email') {
                    if (!GetUtils.isEmail(value)) {
                      return 'Invalid Email';
                    } else {
                      return null;
                    }
                  }
                }
              },
              controller: controller,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Color(0xFF3B3B3B).withOpacity(0.3),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 28.w,
                  vertical: 21.5.h,
                ),
                focusedBorder: isBordered
                    ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                    color: Color(0xFF3B3B3B).withOpacity(0.1),
                    width: 0.5,
                  ),
                )
                    : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: isBordered
                    ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: BorderSide(
                    color: Color(0xFF3B3B3B).withOpacity(0.1),
                    width: 0.5,
                  ),
                )
                    : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintText: label,

                labelStyle: TextStyle(
                  color: textFormFieldColor.withOpacity(0.3),
                  fontSize: 14.sp,
                ),
              ),
            ),
          );
  }
}
// Container(
// width: double.maxFinite,
// height: 57.h,
// padding: registerFlag
// ? EdgeInsets.only(left: 20.w * 0.1)
//     : EdgeInsets.symmetric(
// horizontal: 28.w,
// vertical: 22.h,
// ),
// decoration: BoxDecoration(
// color: Get.isDarkMode ? Theme.of(context).cardColor : Colors.white,
// borderRadius: BorderRadius.circular(borderRadius!),
// border: isBordered
// ? Border.all(
// color: Get.isDarkMode
// ? Theme.of(context).cardColor
//     : const Color(0xFFF4F4F4),
// )
//     : null,
// ),
// child:
