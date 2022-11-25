import 'package:flutter/material.dart';

Widget buttonWidget(
{
  Color? backgroundColor,
  Color? foregroundColor,
  Function()? onPressed,
  Widget? child,
  double? sizeheight,
  double? sizeWidth,
  Color? onPrimary,
  double? elevation,
  BorderSide? borderSide,
  BorderRadiusGeometry? borderRadius,
}
) {
  return SizedBox(
    width: sizeWidth,
    height: sizeheight,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        side: borderSide,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius!,
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: child,
    ),
  );
}
