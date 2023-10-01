import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/screens/chat_screen.dart';
import 'package:food_delivery_green/themes/ui_utils.dart';
import 'package:get/get.dart';

import '../../themes/custom_styles.dart';

class DMScreen extends StatelessWidget {
  const DMScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/pattern2.png',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 100.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    'Chat',
                    style: headerText.copyWith(
                      fontSize: 25.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>ChatScreen(),);
                  },
                  child: Container(
                    height: 80.h,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color: Colors.white,
                      boxShadow: containerShadow(),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/the_weeknd.062.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 17.5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'The Weeknd',
                              style: headerText.copyWith(fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Your Order Just Arrived!',
                              style: subHeaderText.copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Text(
                              '20:00',
                              style: subHeaderText.copyWith(fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
