import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

Widget dividerWdiget(){
  return SizedBox(
    width: double.infinity,
    child: Divider(
      color: MyColor.grayLightColor.withOpacity(.1),
      thickness: 2,
    ),
  );
}