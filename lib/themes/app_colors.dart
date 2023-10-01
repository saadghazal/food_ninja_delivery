import 'dart:ui';

import 'package:flutter/cupertino.dart';

const Color greenColor1 = Color(0xFF53E88B);
const Color greenColor2 = Color(0xFF15BE77);
const Color headerTextLightColor = Color(0xFF09051C);
const Color mainInkColor = Color(0xFFF9A84D);
const Color mainIconColor = Color(0xFFDA6317);
const Color viewMoreColor = Color(0xFFFF7C32);
const Color textFormFieldColor = Color(0xFF3B3B3B);
const Color shadowColor = Color(0xFF5A6CEA);
const Color lightBorderColor = Color(0xFFF4F4F4);
const Color dismissibleColor=Color(0xFFFEAD1D);
const Color memberGoldColor=Color(0xFFFEAD1D);
const LinearGradient buttonGradient = LinearGradient(
  tileMode: TileMode.decal,
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF53E88B),
    Color(0xFF15BE77),
  ],
);
const LinearGradient menuBarActiveGradient = LinearGradient(
  colors: [
    greenColor1,
    greenColor2,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const LinearGradient visaGradient= LinearGradient(
colors: [
Color(0xFF280537),
Color(0xFF56034C),
Color(0xFF890058),
Color(0xFFBC005B),
Color(0xFFEB1254),
],
begin: Alignment.bottomLeft,
end: Alignment.topRight,
);