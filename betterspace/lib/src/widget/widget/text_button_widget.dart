import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Color? foregroundColor;
  final Color? fontColor;
  final TextStyle? textStyle;
  final Function() onPressed;

  const TextButtonWidget({
    Key? key,
    this.foregroundColor,
    this.textStyle,
    required this.text,
    required this.onPressed,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.button!.copyWith(color: fontColor),
      ),
    );
  }
}
