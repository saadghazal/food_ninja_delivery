import 'package:flutter/material.dart';

class DarkTheme {
  static buildDarkTheme() {
    final theme = ThemeData.dark();
    return theme.copyWith(
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
