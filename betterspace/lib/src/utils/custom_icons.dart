import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customSVGIconParsers({double? size, Color? color, String? iconSlug}) {
  return SizedBox(
    height: size ?? 14,
    width: size ?? 14,
    child: SvgPicture.asset(
      "assets/svg_assets/icons/" + (iconSlug ?? "accomodate") + ".svg",
      color: color ?? Colors.blue,
    ),
  );
}
