import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Color? foregroundColor;
  final Color? fontColor;
  final Function() onPressed;

  const TextButtonWidget({
    Key? key,
    this.foregroundColor,
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
      child: AutoSizeText(
        text,
        minFontSize: 10,
        style: Theme.of(context).textTheme.button!.copyWith(color: fontColor),
      ),
    );
  }
}
