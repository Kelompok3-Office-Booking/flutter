import 'package:flutter/material.dart';

Widget textButtonWidget({
  context,
  String? text,
  Color? foregroundColor,
  Color? fontColor,
  TextStyle? textStyle,
  Function()? onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: foregroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Text(
      text!,
      style: Theme.of(context).textTheme.button!.copyWith(color: fontColor),
    ),
  );
}
