import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/widgets/main_widgets/main_icon.dart';
import 'package:get/get.dart';
import '../themes/app_colors.dart';
import '../themes/custom_styles.dart';
import '../themes/ui_utils.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Pattern.png',
            ),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 10.h),
                child: MainIcon(
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
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  'Chat',
                  style: headerText.copyWith(
                    fontSize: 25.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 95.h,
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.r),
                  color: Colors.white,
                  boxShadow: containerShadow(),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/the_weeknd.062.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17.5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'The Weeknd',
                          style: headerText.copyWith(fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return buttonGradient.createShader(rect);
                              },
                              child: CircleAvatar(
                                radius: 5.r,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Online',
                              style: subHeaderText.copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      height: 40.h,
                      width: 40.w,
                      margin: EdgeInsets.only(
                        right: 18.w,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: greenColor1.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/call_logo.png',
                          height: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              // Padding(
              //   padding:EdgeInsets.symmetric(horizontal: 10.w),
              //   child: SizedBox(
              //     height: 400.h,
              //     child: ,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
