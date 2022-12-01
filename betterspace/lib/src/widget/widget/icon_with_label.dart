import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconWithLabel {
  Row asrow(
      {required Icon usedIcon,
      required Text labelText,
      required double spacer}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: spacer),
          child: usedIcon,
        ),
        labelText
      ],
    );
  }
}
