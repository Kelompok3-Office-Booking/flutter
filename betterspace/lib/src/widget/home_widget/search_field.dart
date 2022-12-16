import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

Widget searchPlace({
  context,
  String? hintText,
  TextEditingController? controller,
  Widget? prefixIcon,
  Icon? suffixIcon,
  bool? readOnly,
  Function()? onTap,
  Function(String?)? onChanged,
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
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: MyColor.neutral500, fontSize: AdaptSize.pixel14),
        filled: true,
        fillColor: MyColor.netralColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
