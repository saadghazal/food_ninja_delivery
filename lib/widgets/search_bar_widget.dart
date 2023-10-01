import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/themes/app_colors.dart';


class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265.w,
      height: 50.h,
      padding: EdgeInsets.only(left: 18.w,top: 13.h,bottom: 13.h),
      decoration: BoxDecoration(
        color: mainInkColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: Row(
          children: [
             Icon(
              CupertinoIcons.search,
              color: mainIconColor,
              size: 24.sp,
            ),
             SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: TextField(
                cursorColor: mainIconColor,
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: InputBorder.none,
                  labelText: 'What do you want to order?',
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Color(0xFFDA6317).withOpacity(0.4),
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
