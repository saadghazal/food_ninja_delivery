import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

List<BoxShadow> containerShadow(){
  return [
    BoxShadow(
      color: shadowColor.withOpacity(0.05),
      blurRadius: 30,
      spreadRadius: 0,
      offset: const Offset(0, 20),
    ),
  ];
}