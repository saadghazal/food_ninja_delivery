import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/custom_styles.dart';

class MealWidget extends StatelessWidget {
  const MealWidget({
    required this.mealName,
    required this.mealPrice,
    required this.onTap,
    required this.mealPhoto,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
  final String mealName;
  final double mealPrice;
  final String mealPhoto;

  @override
  Widget build(BuildContext context) {
    //  String firstHalfMealName='';
    //  String secondHalfMealName='';
    // if(mealName.length>=12&& mealName.length<20){
    //   int i=0;
    //  for(i;;i++){
    //    if(mealName[i]==' '){
    //      break;
    //    }
    //    firstHalfMealName+=mealName[i];
    //  }
    //  secondHalfMealName=mealName.substring(i+1);
    // }else if(mealName.length>=20){
    //   int i=0;
    //   int countSpaces=0;
    //   for(i;;i++){
    //     if(mealName[i]==' '){
    //      countSpaces+=1;
    //      if(countSpaces==2){
    //        break;
    //      }
    //     }
    //     firstHalfMealName+=mealName[i];
    //   }
    //   secondHalfMealName=mealName.substring(i+1);
    // }else{
    //   firstHalfMealName=mealName;
    // }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140.w,
        height: 171.h,
        padding: EdgeInsets.only(top: 25.h,bottom: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: const Color(0xFF5A6CEA).withOpacity(0.05),
              offset: const Offset(12, 26),
              spreadRadius: 20,
            ),
          ],
        ),
        child:
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                mealPhoto,
                height: 70.h,
              ),
             SizedBox(
               height: 5.h,
             ),
             Flexible(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      mealName,
                      style: headerText.copyWith(fontSize: 15.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

              SizedBox(
                height: 8.h,
              ),
              Text(
                '\$$mealPrice',
                style: subHeaderText.copyWith(
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),

    );
  }
}
