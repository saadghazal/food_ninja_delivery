import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/controllers/bottom_navigation_controller.dart';
import 'package:food_delivery_green/screens/home_screens/home_screen.dart';
import 'package:food_delivery_green/screens/home_screens/profile_screen.dart';
import 'package:food_delivery_green/widgets/main_widgets/menu_bar_widget.dart';
import 'package:get/get.dart';

import '../../themes/app_colors.dart';
import 'cart_screen.dart';
import 'dm_screen.dart';

class MainScreen extends GetView<BottomNavigationController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreen(),
      ProfileScreen(),
      CartScreen(),
      DMScreen(),
    ];
    List<Widget> activeMenu = [
      const MenuBarWidget(
        icon: Icons.home_filled,
        menuName: 'Home',
      ),
      const MenuBarWidget(
        icon: CupertinoIcons.person_alt_circle,
        menuName: 'Profile',
      ),
      const MenuBarWidget(
        icon: Icons.shopping_bag_outlined,
        menuName: 'Cart',
      ),
      const MenuBarWidget(
        icon: CupertinoIcons.chat_bubble_fill,
        menuName: 'Home',
      )
    ];
    List<IconData> icons = [
      Icons.home_filled,
      CupertinoIcons.person_alt_circle,
      Icons.shopping_bag_outlined,
      CupertinoIcons.chat_bubble_fill,
    ];
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            screens[controller.screenIndex.value],
            Stack(
              children: [

              ],
            )
          ],
        ),
        bottomNavigationBar:  Container(
            width: double.maxFinite,
            height: 75.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 15.h,
              bottom: 15.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF5A6CEA).withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                icons.length,
                    (index) => controller.screenIndex.value == index
                    ? activeMenu[index]
                    : GestureDetector(
                  onTap: () {
                    controller.selectScreen(index);
                  },
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return menuBarActiveGradient.createShader(rect);
                    },
                    child: Icon(
                      icons[index],
                      color: Colors.white.withOpacity(0.5),
                      size: 25.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),

      );
    });
  }
}
