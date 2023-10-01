import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';

class SearchLocationWidget extends StatelessWidget {
  SearchLocationWidget({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      margin:  EdgeInsets.only(left: 17.w, right: 17.w),
      padding:  EdgeInsets.only(left: 20.w,right: 20.w),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
        child: Row(
          children: [

            Expanded(
              child: TextFormField(
                controller: searchController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hintText: 'Find Your Location',
                  hintStyle: TextStyle(
                    color: Color(0xFFDA6317).withOpacity(0.5),
                    fontSize: 14.sp,
                  ),


                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (searchController.text.isNotEmpty) {}
              },
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(CupertinoIcons.search),
              color: Color(0xFFDA6317),
              iconSize: 26.sp,
            ),
          ],
        ),
      ),
    );
  }
}
