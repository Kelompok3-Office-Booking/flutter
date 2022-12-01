import 'package:flutter/material.dart';

Widget transparentAppbarWidge(
    {required BuildContext context,
    required Text titles,
    double? titleSpacer,
    IconButton? leadingIcon,
    IconButton? actionIcon}) {
  return AppBar(
    titleSpacing: titleSpacer,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: leadingIcon,
    title: titles,
    actions: [actionIcon!],
  );
}
