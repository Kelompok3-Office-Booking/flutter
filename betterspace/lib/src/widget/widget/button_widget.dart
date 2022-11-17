import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Function() onPressed;
  final Widget child;
  final double? sizeheight;
  final double? sizeWidth;
  final Color? onPrimary;
  final double? elevation;
  final BorderSide? borderSide;
  final BorderRadiusGeometry borderRadius;

  const ButtonWidget({
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    this.onPrimary,
    this.sizeWidth,
    this.sizeheight,
    this.borderSide,
    this.elevation,
    required this.borderRadius,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth,
      height: sizeheight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          side: borderSide,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: child,
      ),
    );
  }
}