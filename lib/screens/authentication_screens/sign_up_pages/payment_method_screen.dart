import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/controllers/visa_controller.dart';
import 'package:get/get.dart';

import 'package:food_delivery_green/refs/constants.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/upload_profile_photo_screen.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_button.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_container.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_icon.dart';

import 'package:food_delivery_green/widgets/payment_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);
  static const routName = '/pay';

  @override
  Widget build(BuildContext context) {
    var visaController = Get.find<VisaController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFEFEFF),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
              image: AssetImage(
                'assets/images/pattern2.png',
              ),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
                vertical: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainIcon(
                    borderRadius: 15.r,
                    width: 45.w,
                    height: 45.h,
                    backgroundColor: mainIconColor.withOpacity(0.1),
                    onTap: () {
                      Get.back();
                    },
                    icon: Icons.arrow_back_ios_new_outlined,
                    iconColor: mainIconColor,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  userInfoScreenTitle(
                    'Payment Method',
                    headerText.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  userInfoScreenTitle(
                    securityText,
                    Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.w300,
                          height: 1.5.h,
                        ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MainContainer(
                    onTap: () {},
                    iconHeight: 23.h,
                    showText: false,
                    icon: 'assets/icons/PayPal.svg.png',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<VisaController>(builder: (visa) {
                    if (visa.userCardNumber.isNotEmpty) {
                      return visaAfterInputInfo(
                          cardNumber: visa.userCardNumber);
                    }
                    return MainContainer(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            Get.put(VisaController());
                            return const PaymentBottomSheet();
                          },
                        );
                        Get.find<VisaController>().saveCardInfo();
                      },
                      iconHeight: 16.h,
                      showText: false,
                      icon: 'assets/icons/visa.svg.png',
                    );
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  MainContainer(
                    onTap: () {},
                    iconHeight: 30.h,
                    showText: false,
                    icon: 'assets/icons/pay.png',
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child:
                       MainButton(
                        textColor: Colors.white,
                        width: 157.h,
                        height: 57.h,
                        isGradient: true,
                        borderRadius: 15.r,
                        fontSize: 16.sp,
                        onTap: () async {
                          if (visaController.userCardNumber.isNotEmpty) {
                            Get.find<AuthController>().saveUserVisaInfo(
                              cardNumber: visaController.userCardNumber,
                              cardHolderName: visaController.userCardHolderName,
                              cardExpiryDate: visaController.userCardExpiryDate,
                              cardCVV: visaController.userCVV,
                            );
                            Get.toNamed(UploadProfilePhotoScreen.routName);
                          }
                        },
                        text: 'Next',

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget visaAfterInputInfo({required String cardNumber}) {
  cardNumber.replaceRange(4, cardNumber.length, 'x');

  return InkWell(
    onTap: () {},
    child: Container(
      height: 75.h,
      // width: width,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.09),
            blurRadius: 30,
            spreadRadius: 0,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/icons/visa.svg.png',
            height: 16.h,
          ),
          Text(
            cardNumber,
            style: headerText.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
