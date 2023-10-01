import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/auth_controller.dart';
import 'package:food_delivery_green/controllers/image_picker_controller.dart';
import 'package:food_delivery_green/screens/authentication_screens/sign_up_pages/set_loation_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/custom_styles.dart';
import '../../../widgets/main_widgets/main_button.dart';
import '../../../widgets/main_widgets/main_container.dart';
import '../../../widgets/main_widgets/main_icon.dart';

class UploadProfilePhotoScreen extends GetView<ImagePickerController> {
  const UploadProfilePhotoScreen({Key? key}) : super(key: key);
  static const routName = '/pic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  'Upload Your Photo\nProfile',
                  style: headerText.copyWith(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'This data will be displayed in your account\nprofile for security',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GetBuilder<ImagePickerController>(
                    id: 'pic',
                    builder: (logic) {
                      return Visibility(
                        replacement: Column(
                          children: [
                            MainContainer(
                              onTap: () {
                                controller.pickImage(ImageSource.gallery);
                              },
                              height: 130.h,
                              iconHeight: 50.h,
                              showText: true,
                              icon: 'assets/icons/Gallery.png',
                              text: 'From Gallery',
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MainContainer(
                              onTap: () {
                                controller.pickImage(ImageSource.camera);
                              },
                              height: 130.h,
                              iconHeight: 50.h,
                              showText: true,
                              icon: 'assets/icons/Group.png',
                              text: 'Take Photo',
                            ),
                          ],
                        ),
                        visible: controller.imagePath.isNotEmpty,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 240.h,
                            width: 245.w,
                            padding: EdgeInsets.only(right: 10.w, top: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              image: DecorationImage(
                                image: AssetImage(controller.imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () => controller.clearImage(),
                                child: Icon(
                                  Icons.cancel_rounded,
                                  color: Color(0xFFFEFEFF),
                                  size: 31.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child:  MainButton(
                      textColor: Colors.white,
                      width: 157.h,
                      height: 57.h,
                      isGradient: true,
                      borderRadius: 15.r,
                      fontSize: 16.sp,
                      onTap: () async {
                        if (controller.imagePath.isNotEmpty) {
                          File image=File(controller.pickedImage!.path);
                           Get.find<AuthController>()
                              .saveImageInfo(userImage: image);
                          Get.toNamed(SetLocationScreen.routName);
                        } else {
                          print('hi');
                        }
                      },
                      text: 'Next',
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
