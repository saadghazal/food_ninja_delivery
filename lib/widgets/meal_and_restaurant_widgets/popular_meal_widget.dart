import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../themes/custom_styles.dart';

class PopularMeal extends StatelessWidget {
  const PopularMeal({
    required this.name,
    required this.image,
    required this.price,
    this.isCartItem=false,

    Key? key,
  }) : super(key: key);
  final String image;
  final double price;
  final String name;
  final bool isCartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 10.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            image,
            fit: BoxFit.fitWidth,
            height: 65.h,
            width: 65.w,
          ),
          SizedBox(
            width: 20.w,
          ),
          Flexible(
            flex: 2,
            child: Text(
              name,
              style: headerText.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            '\$$price',
            style: headerText.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFEAD1D),
            ),
          ),
        ],
      ),
    );
  }
}
