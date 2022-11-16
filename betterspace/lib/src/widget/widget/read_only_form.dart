import 'package:flutter/material.dart';

class ReadOnlyTextFields extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? hint;
  final Function() onTap;
  final Widget? label;
  final TextInputAction? textInputAction;

  const ReadOnlyTextFields({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.textInputAction,
    this.label,
    this.hint,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //cursorColor: MyColor.deepAqua,
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        label: label,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        filled: true,
        //fillColor: MyColor.border,
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              //color: MyColor.errorColor,
              ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              //color: MyColor.deepAqua,
              ),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              //color: MyColor.outlineBorder,
              ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
