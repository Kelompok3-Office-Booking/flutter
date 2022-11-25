import 'package:flutter/material.dart';

Widget readOnlyWidget({
  context,
  TextEditingController? controller,
  Widget? suffixIcon,
  String? hint,
  Function()? onTap,
  Widget? label,
  TextInputAction? textInputAction,
}) {
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
