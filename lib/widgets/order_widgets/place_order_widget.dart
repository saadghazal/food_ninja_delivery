import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/widgets/order_widgets/bill_order_row.dart';

import '../../themes/app_colors.dart';
import '../../themes/custom_styles.dart';

class PlaceOrderWidget extends StatelessWidget {
  const PlaceOrderWidget({
    required this.totalPrice,
    required this.totalDiscount,
    required this.totalItemsPrice,
    Key? key,
  }) : super(key: key);
  final double totalPrice;
  final double totalDiscount;
  final double totalItemsPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.h,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: buttonGradient,
        boxShadow: [
          BoxShadow(
            color: greenColor1.withOpacity(0.4),
            blurRadius: 30,
            spreadRadius: 0,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -65,
            bottom: -65,
            child: Image.asset(
              'assets/images/place_order_background.png',
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.25),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
              vertical: 15.h,
            ),
            child: Column(
              children: [
                BillOrderRow(
                  billLabel: 'Sub-Total',
                  totalServicePrice: totalItemsPrice,
                ),
                SizedBox(
                  height: 8.h,
                ),
                BillOrderRow(
                  billLabel: 'Delivery Charge',
                  totalServicePrice: totalPrice == 0 ? 0 : 2,
                ),
                SizedBox(
                  height: 8.h,
                ),
                BillOrderRow(
                  billLabel: 'Discount',
                  totalServicePrice: totalDiscount,
                ),
                SizedBox(
                  height: 20.h,
                ),
                BillOrderRow(
                  billLabel: 'Total',
                  totalServicePrice: totalPrice,
                  isTotal: true,
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  height: 60.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return buttonGradient.createShader(rect);
                      },
                      child: Text(
                        'Place My Order',
                        style: headerText.copyWith(
                            color: Colors.white, fontSize: 14.sp),
                      ),
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
