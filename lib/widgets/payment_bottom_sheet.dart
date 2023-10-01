import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/visa_controller.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_button.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../themes/custom_styles.dart';
import 'main_widgets/visa_text_field.dart';

enum NewPageIndex {
  next,
  back,
}

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  @override
  void initState() {

    super.initState();
  }
  int initialPage = 0;
  List<String> fieldTitle = [
    'Card Number',
    'Cardholder Name',
    'Valid Thru',
    'Security Code(CVV)',
  ];

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      initialPage: initialPage,
      viewportFraction: 0.85,
    );
    void nextAndBackPageIndex(NewPageIndex newPageIndexStatus) {
      if (newPageIndexStatus == NewPageIndex.back) {
        initialPage -= 1;
        setState(
          () {
            pageController.animateToPage(
              initialPage,
              duration: const Duration(
                milliseconds: 800,
              ),
              curve: Curves.easeInOutQuad,
            );
            FocusScope.of(context).nextFocus();
          },
        );
      } else {
        if (initialPage == 3) {
          FocusScope.of(context).unfocus();
          Get.back();
          return;
        }
        initialPage += 1;
        setState(
          () {
            pageController.animateToPage(
              initialPage,
              duration: const Duration(
                milliseconds: 800,
              ),
              curve: Curves.easeInOutQuad,
            );
            FocusScope.of(context).nextFocus();
          },
        );
      }
    }

    TextEditingController cardNumber = TextEditingController();
    TextEditingController cardHolderName = TextEditingController();
    TextEditingController cvvController = TextEditingController();
    TextEditingController expiryDate = TextEditingController();
    List<TextEditingController> textCont = [
      cardNumber,
      cardHolderName,
      expiryDate,
      cvvController,
    ];
    return GetBuilder<VisaController>(

      builder: (visa) {

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },


            child: Container(
              height: 750.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                ),
              ),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 5.h),
                        height: 4.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20.h,
                        right: 10.w,
                        left: 10.w,
                      ),
                      height: 200.h,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        gradient: visaGradient,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFBC005B).withOpacity(0.4),
                            blurRadius: 30,
                            spreadRadius: 0,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/Contactless_Payment.png',
                                height: 20.h,
                              ),
                              Image.asset(
                                'assets/images/Visa-logo-white.png',
                                height: 15.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          labelText(
                            text: visa.cardNumber.isEmpty
                                ? 'XXXX XXXX XXXX XXXX'
                                : visa.cardNumber,
                            fontSize: 20,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  labelText(
                                    text: 'Cardholder Name',
                                    fontSize: 13,
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                  labelText(
                                    text: 'Valid Thru',
                                    fontSize: 13,
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  labelText(
                                    text: visa.cardHolderName.isEmpty
                                        ? 'Name Surname'
                                        : visa.cardHolderName,
                                    fontSize: 13,
                                    textColor: Colors.white,
                                  ),
                                  labelText(
                                    text: visa.expiryDate.isEmpty
                                        ? 'XX/YY'
                                        : visa.expiryDate,
                                    fontSize: 13,
                                    textColor: Colors.white,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                      ),
                      child: labelText(
                        text: 'Type in your card details:',
                        fontSize: 22,
                        textColor: headerText.color!,
                        fontWeight: headerText.fontWeight!,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 100.h,
                      child: PageView.builder(
                        controller: pageController,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            VisaTextField(
                              onChanged: (value) {
                                switch (index) {
                                  case 0:
                                    visa.onCardNumberChange(
                                      value,
                                    );
                                    break;
                                  case 1:
                                    visa.onCardholderChange(
                                      value,
                                    );
                                    break;
                                  case 2:
                                    visa.onExpiryDateChange(
                                      value,
                                    );
                                    break;
                                }
                              },
                              controller: textCont[index],
                              index: index,
                              hintText: fieldTitle[index],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: initialPage > 0,
                          child: backAndNextWidget(
                              'Back',
                              () => nextAndBackPageIndex(NewPageIndex.back),
                              NewPageIndex.back),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        backAndNextWidget(
                          initialPage == 3 ? 'Done' : 'Next',
                          () => nextAndBackPageIndex(NewPageIndex.next),
                          NewPageIndex.next,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
        );
      },
    );
  }
}

Widget labelText({
  required String text,
  required double fontSize,
  required Color textColor,
  FontWeight fontWeight = FontWeight.w400,
  double? letterSpacing,
}) {
  return Text(
    text,
    style: GoogleFonts.inter(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: textColor,
      letterSpacing: letterSpacing,
    ),
  );
}

Widget backAndNextWidget(
  String label,
  void Function() onTap,
  NewPageIndex newPageIndex,
) {
  return Align(
    alignment: Alignment.centerRight,
    child: InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        height: 40.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: newPageIndex == NewPageIndex.back
                ? Radius.circular(5.r)
                : Radius.circular(15.r),
            bottomLeft: newPageIndex == NewPageIndex.back
                ? Radius.circular(5.r)
                : Radius.circular(15.r),
            bottomRight: newPageIndex == NewPageIndex.back
                ? Radius.circular(15.r)
                : Radius.circular(5.r),
            topRight: newPageIndex == NewPageIndex.back
                ? Radius.circular(15.r)
                : Radius.circular(5.r),
          ),
          gradient: visaGradient,
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );
}
