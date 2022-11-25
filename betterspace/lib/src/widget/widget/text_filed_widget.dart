import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFormFields extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? hintTexts;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final String? label;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehaviour;

  const TextFormFields({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.hintTexts,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.label,
    this.floatingLabelBehaviour,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColor.darkBlueColor,
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintTexts,
        label: Text(
          '$label',
          style: Theme.of(context).textTheme.bodyText1,
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
}
