import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_screen.dart';
import 'package:food_delivery_green/themes/app_colors.dart';
import 'package:food_delivery_green/themes/custom_styles.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_button.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  static const routeName = '/sign-in';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formState = GlobalKey<FormState>();

  void login() {
    final isValid = formState.currentState!.validate();
    if (isValid) {
      Get.find<AuthController>().signIn(
        email: emailController.text,
        password: passwordController.text,
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white24,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(rect);
                  },
                  child: Image.asset(
                    'assets/images/Pattern.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Text(
                        'Login To Your Account',
                        style: headerText.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(
                          left: 25.w,
                          right: 25.w,
                        ),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: shadowColor.withOpacity(0.05),
                              blurRadius: 30,
                              spreadRadius: 0,
                              offset: const Offset(0, 20),
                            ),
                          ],
                        ),
                        child: Form(
                          key: formState,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MainTextField(
                                registerFlag: false,
                                label: 'Email',
                                controller: emailController,
                                isBordered: true,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              MainTextField(
                                registerFlag: false,
                                label: 'Password',
                                controller: passwordController,
                                isBordered: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Or Continue With',
                        style: headerText.copyWith(
                          fontSize: 14.sp * 0.8,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: shadowColor.withOpacity(0.05),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: const Offset(0, 20),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WithButton(
                              width: 152.w,
                              height: 57.h,
                              label: 'Facebook',
                              icon: 'assets/images/facebook.png',
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 21.w,
                            ),
                            WithButton(
                              width: 152.w,
                              height: 57.h,
                              label: 'Google',
                              icon: 'assets/images/google.svg.png',
                              onTap: () =>
                                  Get.find<AuthController>().signInWithGoogle(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ShaderMask(
                        shaderCallback: (rect) {
                          return buttonGradient.createShader(rect);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(SignUpScreen.routeName),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return buttonGradient.createShader(rect);
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () {
                          if (auth.isLoading.value == true) {
                            return SizedBox(
                              child: LoadingAnimationWidget.inkDrop(
                                color: greenColor1,
                                size: 35.sp,
                              ),
                            );
                          } else {
                            return MainButton(
                              borderRadius: 15.r,
                              width: 157.w,
                              height: 57.h,
                              onTap: () {
                                login();
                              },
                              isGradient: true,
                              text: 'Login',
                              textColor: Colors.white,
                              fontSize: 16.sp,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WithButton extends StatelessWidget {
  const WithButton({
    required this.label,
    this.height = 60,
    this.width = 165,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final double width;
  final double height;
  final String icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: lightBorderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                icon,
                fit: BoxFit.cover,
                width: 25.r,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: headerText.copyWith(
                fontSize: 14.sp * 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
