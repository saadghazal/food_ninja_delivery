import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/fill_bio_screen.dart';
import 'package:food_delivery_green/themes/ui_utils.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_button.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../controllers/auth_controller.dart';
import '../../themes/app_colors.dart';
import '../../themes/custom_styles.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController signEmailController = TextEditingController();
  TextEditingController signPasswordController = TextEditingController();
  final signUpState = GlobalKey<FormState>();
  static const routeName = '/sign-up';

  void signUp() {
    final isValid = signUpState.currentState!.validate();
    if (isValid) {
      Get.find<AuthController>().signUp(
        username: usernameController.text,
        email: signEmailController.text,
        password: signPasswordController.text,
      );
      print('signed up correctly');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/Pattern.png'),
              ),
            ),
            child: Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/images/logo.png'),
                            GradientText(
                              'FoodNinja',
                              gradientDirection: GradientDirection.ltr,
                              colors: const [
                                Color(0xFF53E88B),
                                Color(0xFF15BE77),
                              ],
                              style: GoogleFonts.viga(
                                fontSize: 40.sp,
                              ),
                            ),
                            Text(
                              'Deliver Favorite Food',
                              style: GoogleFonts.inter(
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Text(
                          'Sign Up For Free',
                          style: headerText.copyWith(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            right: 25.w,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: containerShadow(),
                            ),
                            child: Form(
                              key: signUpState,
                              child: Column(
                                children: [
                                  MainTextField(
                                    icon: 'assets/icons/Profile.png',
                                    label: 'Username',
                                    controller: usernameController,
                                    registerFlag: true,
                                    isBordered: true,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  MainTextField(
                                    icon: 'assets/icons/signUpEmail.png',
                                    label: 'Email',
                                    controller: signEmailController,
                                    registerFlag: true,
                                    isBordered: true,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  MainTextField(
                                    icon: 'assets/icons/Lock.png',
                                    label: 'Password',
                                    controller: signPasswordController,
                                    registerFlag: true,
                                    isBordered: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            top: 15.h,
                          ),
                          child: Column(
                            children: [
                              checkRow('Keep Me Signed In'),
                              checkRow('Email Me About Special Pricing'),
                            ],
                          ),
                        ),
                        Obx( () {
                          if (Get.find<AuthController>().isLoading.value) {
                            return LoadingAnimationWidget.inkDrop(
                              color: greenColor1,
                              size: 35.sp,
                            );
                          }
                          return MainButton(
                            fontSize: 16.sp,
                            width: 175.w,
                            height: 57.h,
                            isGradient: true,
                            borderRadius: 12.r,
                            onTap: () {
                              signUp();
                            },
                            text: 'Create Account',
                            textColor: Colors.white,
                          );
                        }),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return buttonGradient.createShader(rect);
                            },
                            child: const Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget checkRow(String label) {
  return Row(
    children: [
      Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          width: 0.5,
          color: Colors.grey.withOpacity(0.6),
        ),
        activeColor: greenColor1,
        value: true,
        onChanged: (value) {},
        shape: CircleBorder(),
      ),
      Text(
        label,
        style: subHeaderText.copyWith(
          color: Colors.grey.shade700,
          fontSize: 12.sp,
        ),
      ),
    ],
  );
}
