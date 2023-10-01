import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/app_colors.dart';
import '../../themes/custom_styles.dart';
import '../../themes/ui_utils.dart';

class RatingCardWidget extends StatelessWidget {
  const RatingCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 128.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.only(
        top: 10.h,
        left: 10.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: containerShadow(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 65.h,
            width: 65.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.r),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/the_weeknd.062.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Weeknd',
                        style: headerText.copyWith(
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        '12 April 2021',
                        style: subHeaderText.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Container(
                    height: 35.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(18.5.r),
                      color: greenColor1.withOpacity(0.1),
                    ),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return buttonGradient
                            .createShader(rect);
                      },
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            '5',
                            style: headerText.copyWith(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'This Is great, So delicious! You Must\nHere, With Your family . . ',
                style: subHeaderText.copyWith(
                  fontSize: 12.sp,
                  height: 1.5,
                  color: headerTextLightColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
