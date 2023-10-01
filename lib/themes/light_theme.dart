import 'package:flutter/material.dart';
import 'package:food_delivery_green/themes/app_colors.dart';

class LightTheme {
  static ThemeData buildLightTheme() {
    final theme = ThemeData.light();
    return theme.copyWith(
      backgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
          color: headerTextLightColor,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
