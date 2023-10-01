import 'package:flutter/material.dart';

class MainIcon extends StatelessWidget {
  const MainIcon({
    this.iconColor,
    this.iconImage,
    required this.backgroundColor,
    this.icon,
    this.height = 55,
    this.width = 55,
    this.borderRadius = 20,
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Color? iconColor;
  final IconData? icon;
  final String? iconImage;
  final Color backgroundColor;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: backgroundColor,
        ),
        child: iconImage != null
            ? Image.asset(iconImage!)
            : Center(
              child: Icon(
                  icon,
                  color: iconColor,
                ),
            ),
      ),
    );
  }
}
