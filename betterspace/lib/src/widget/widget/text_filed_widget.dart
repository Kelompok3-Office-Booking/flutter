import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

Widget textFormFields({
  TextEditingController? controller,
  TextStyle? textStyle,
  Widget? suffixIcon,
  bool? obscureText,
  String? hintTexts,
  TextInputType? keyboardType,
  int? maxLines,
  int? minLines,
  String? label,
  TextInputAction? textInputAction,
  FloatingLabelBehavior? floatingLabelBehaviour,
}){
  return TextFormField(
    cursorColor: MyColor.darkBlueColor,
    obscureText: obscureText!,
    controller: controller,
    maxLines: maxLines,
    minLines: minLines,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintTexts,
      label: Text(
        '$label',
        style: textStyle,
      ),
      floatingLabelBehavior: floatingLabelBehaviour,
      filled: true,
      //fillColor: MyColor.border,
      suffixIcon: suffixIcon,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColor.redColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColor.grayLightColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColor.grayLightColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
