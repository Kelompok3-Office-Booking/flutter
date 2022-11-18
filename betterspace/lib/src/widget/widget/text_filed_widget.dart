import 'package:flutter/material.dart';

class TextFormFields extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final String? label;
  final TextInputAction? textInputAction;

  const TextFormFields({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.hintText,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.label,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //cursorColor: MyColor.deepAqua,
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: Text(
          '$label',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        filled: true,
        //fillColor: MyColor.border,
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              //color: MyColor.errorColor,
              ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              //color: MyColor.deepAqua,
              ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              //color: MyColor.outlineBorder,
              ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
