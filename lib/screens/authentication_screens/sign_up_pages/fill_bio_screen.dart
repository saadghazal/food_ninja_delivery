import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/refs/constants.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/payment_method_screen.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:food_delivery_green/themes/ui_utils.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_button.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_icon.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_text_field.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FillBioScreen extends StatelessWidget {
  FillBioScreen({Key? key}) : super(key: key);
  static const routName = '/fill-bio';
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    'Fill in your bio to get\nstarted',
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
                  userInfoContainer('First Name', firstController),
                  SizedBox(
                    height: 20.h,
                  ),
                  userInfoContainer('Last Name', lastController),
                  SizedBox(
                    height: 20.h,
                  ),
                  userInfoContainer('Mobile Number', mobileController),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Obx( () {
                      if (Get.find<AuthController>().isLoading.value) {
                        return LoadingAnimationWidget.inkDrop(
                          color: greenColor1,
                          size: 35.sp,
                        );
                      }
                      return MainButton(
                        fontSize: 16.sp,
                        textColor: Colors.white,
                        width: 157.w,
                        height: 57.h,
                        isGradient: true,
                        borderRadius: 15.r,
                        onTap: () async {
                          if (firstController.text.isEmpty ||
                              lastController.text.isEmpty ||
                              mobileController.text.isEmpty) {
                            return;
                          }
                           Get.find<AuthController>()
                              .saveUserNameAndPhoneNumber(
                            firstController.text,
                            lastController.text,
                            mobileController.text,
                          );
                          Get.toNamed(PaymentMethodScreen.routName);
                        },
                        text: 'Next',
                      );
                    }),
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

Widget userInfoContainer(String label, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: containerShadow(),
    ),
    child: MainTextField(
      borderRadius: 22.r,
      isBordered: false,
      label: label,
      controller: controller,
      registerFlag: false,
    ),
  );
}
