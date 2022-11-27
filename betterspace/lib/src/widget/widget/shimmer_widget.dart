import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerLoading({
  double? height,
  double? width,
}) {
  return Shimmer.fromColors(
    baseColor: MyColor.grayLightColor.withOpacity(.4),
    highlightColor: MyColor.whiteColor,
    child: Container(
      height: height,
      width: width,
      color: MyColor.whiteColor,
    ),
  );
}
