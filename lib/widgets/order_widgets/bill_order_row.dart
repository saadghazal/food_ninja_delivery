import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/custom_styles.dart';

class BillOrderRow extends StatelessWidget {
  const BillOrderRow({
    required this.billLabel,
    required this.totalServicePrice,
    this.isTotal = false,
    Key? key,
  }) : super(key: key);
  final String billLabel;
  final double totalServicePrice;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          billLabel,
          style: headerText.copyWith(
            fontSize: isTotal ? 18.sp : 14.sp,
            color: Colors.white,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
          ),
        ),
        Text(
          '${totalServicePrice.toStringAsFixed(2)}\$',
          style: headerText.copyWith(
            fontSize: isTotal ? 18.sp : 14.sp,
            color: Colors.white,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
