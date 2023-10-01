import 'package:flutter/material.dart';
import 'package:food_delivery_green/themes/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.borderRadius,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    required this.text,
    this.isGradient = false,
    this.primaryColor,
    this.width = 100,
    this.height = 50,
    this.fontSize = 20,
    Key? key,
  }) : super(key: key);
  final double? fontSize;
  final double? width;
  final double? height;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? isGradient;
  final VoidCallback onTap;
  final Color? primaryColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: isGradient! ? buttonGradient : null,
          color: isGradient! ? null : backgroundColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
