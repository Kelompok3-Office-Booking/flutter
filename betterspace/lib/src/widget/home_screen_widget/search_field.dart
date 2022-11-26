import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

Widget searchPlace(
  context,
  String hintText,
  TextEditingController controller,
  Icon prefixIcon,
) {
  return TextFormField(
    controller: controller,
    cursorColor: MyColor.grayLightColor,
    readOnly: true,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: MyColor.netralColor,
      prefixIcon: prefixIcon,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: MyColor.netralColor,
            ),
        borderRadius: BorderRadius.circular(40),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: MyColor.netralColor,
            ),
        borderRadius: BorderRadius.circular(40),
      ),
    ),
  );
}
