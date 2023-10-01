import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';
import '../themes/custom_styles.dart';
import 'main_widgets/main_button.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/offer_pattern.png',
            fit: BoxFit.fill,

          ),
        ),
        Positioned(
          bottom: 0,
          left: -10,
          child: Image.asset(
            'assets/images/offer_image.png',
            fit: BoxFit.cover,
            height: 150.h,
          ),
        ),
        Positioned(
          right: 20.w,
          top: 30.h,
          child:

           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special Deal For\nOctober',
                  style: headerText.copyWith(
                    color: Colors.white,
                    fontSize: 17.sp,
                  ),
                ),
                 SizedBox(
                  height: 15.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      6.r,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 50,
                      ),
                    ],
                  ),
                  child: MainButton(
                    borderRadius: 10.r,
                    height: 30.h,
                    width: 80.w,
                    fontSize: 10.sp,
                    backgroundColor: Colors.white,
                    textColor: greenColor1,
                    onTap: () {},
                    text: 'Buy Now',
                  ),
                )
              ],
            ),
          ),

      ],
    );
  }
}
