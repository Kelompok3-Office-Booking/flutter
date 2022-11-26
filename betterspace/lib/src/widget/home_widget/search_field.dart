import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

Widget searchPlace({
  context,
  String? hintText,
  TextEditingController? controller,
  Icon? prefixIcon,
  bool? readOnly,
  Function()? onTap,
  EdgeInsetsGeometry? margin,
}) {
  return Container(
    margin: margin,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          offset: const Offset(3, 3),
          color: MyColor.grayLightColor.withOpacity(.4),
          blurRadius: 3,
        ),
      ],
    ),
    child: TextFormField(
      controller: controller,
      cursorColor: MyColor.grayLightColor,
      readOnly: readOnly!,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: MyColor.netralColor,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.netralColor,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.netralColor,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    ),
  );
}
