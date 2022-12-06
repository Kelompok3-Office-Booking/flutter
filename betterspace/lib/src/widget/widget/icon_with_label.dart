import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconWithLabel {
  Row asrow({
    required BuildContext contexts,
    required IconData usedIcon,
    required String labelText,
    double? iconSize,
    double? spacer,
    double? fontSizes,
    Color? iconColor,
    Color? fontColor,
    TextStyle? textStyles,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: spacer ?? 2),
          child: Icon(
            usedIcon,
            size: iconSize ?? AdaptSize.screenHeight * .024,
            color: iconColor ?? MyColor.primary700,
          ),
        ),
        Text(
          labelText,
          style: textStyles ??
              (Theme.of(contexts).textTheme.bodyMedium!.copyWith(
                    color: fontColor ?? MyColor.neutral100,
                    fontSize: fontSizes ?? AdaptSize.screenHeight / 1000 * 14,
                  )),
        ),
      ],
    );
  }
}
