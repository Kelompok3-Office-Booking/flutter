import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future toastAllert({
  String? msg,
  Color? backgroundColor,
}) {
  return Fluttertoast.showToast(
    msg: msg!,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: AdaptSize.screenHeight * .016,
  );
}
