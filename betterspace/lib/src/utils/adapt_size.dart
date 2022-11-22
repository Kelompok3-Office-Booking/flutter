import 'package:flutter/widgets.dart';

class AdaptSize {
  static size({
    required context,
  }) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    paddingTop = _mediaQueryData.padding.top;
  }

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double paddingTop;
}
