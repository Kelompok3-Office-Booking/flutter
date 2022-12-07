import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget partialRoundedCard({
  required Widget childWidgets,
  required double cardBottomPadding,
  double? cardTopRightRadius,
  double? cardTopLeftRadius,
  double? cardBottomRightRadius,
  double? cardBottomLeftRadius,
  double? elevations,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(cardTopLeftRadius ?? 0),
        topRight: Radius.circular(cardTopRightRadius ?? 0),
        bottomLeft: Radius.circular(cardBottomLeftRadius ?? 0),
        bottomRight: Radius.circular(cardBottomRightRadius ?? 0),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey, //New
          blurRadius: 5.0,
          offset: Offset(0, -2),
        ),
      ],
    ),
    child: Container(
      decoration: BoxDecoration(
        color: MyColor.neutral900,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cardTopLeftRadius ?? 0),
          topRight: Radius.circular(cardTopRightRadius ?? 0),
          bottomLeft: Radius.circular(cardBottomLeftRadius ?? 0),
          bottomRight: Radius.circular(cardBottomRightRadius ?? 0),
        ),
      ),
      child: childWidgets,
    ),
  );
}
