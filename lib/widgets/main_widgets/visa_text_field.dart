import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_green/themes/app_colors.dart';

class VisaTextField extends StatelessWidget {
  const VisaTextField({
    required this.onChanged,
    required this.controller,
    required this.index,
    required this.hintText,
    Key? key,
  }) : super(key: key);
  final Function(String) onChanged;
  final String hintText;
  final TextEditingController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, right: 5.w),
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      width: double.maxFinite,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.09),
            blurRadius: 30,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: shadowColor.withOpacity(0.09),
            blurRadius: 30,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          autocorrect: false,
          autofocus: true,
          enableSuggestions: false,
          keyboardType: index == 0 || index == 2 || index == 3
              ? TextInputType.number
              : null,
          textCapitalization: TextCapitalization.words,
          style: const TextStyle(color: Colors.black),
          controller: controller,
          onChanged: onChanged,
          scrollPadding: EdgeInsets.zero,
          maxLength: index == 0
              ? 16
              : index == 3
                  ? 3
                  : null,
          inputFormatters: index == 2
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                  CardMonthInputFormatter(),
                ]
              : null,
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            hintStyle: TextStyle(
              color: textFormFieldColor.withOpacity(0.3),
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i == 0) {
        if (int.parse(newText[i]) > 1) {
          buffer.write('0${newText[i]}');
        } else {
          buffer.write(newText[i]);
        }
      } else if (i == 1) {
        if ((int.parse(newText[i]) > 2 || int.parse(newText[i]) == 0) &&
            newText[0] == '1') {
          break;
        } else {
          buffer.write(newText[i]);
        }
      } else {
        buffer.write(newText[i]);
      }

      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
