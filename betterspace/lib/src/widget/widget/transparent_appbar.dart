import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget transparentAppbarWidge(
    {required BuildContext context,
    required Text Title,
    double? titleSpacer,
    IconButton? leadingIcon,
    IconButton? actionIcon}) {
  return AppBar(
    titleSpacing: titleSpacer,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: leadingIcon,
    title: Title,
    actions: [actionIcon!],
  );
}
