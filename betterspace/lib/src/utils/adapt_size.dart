import 'package:flutter/widgets.dart';

class AdaptSize {
  static size({
    required context,
  }) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    dynamicBodyTextMedium = _mediaQueryData.size.height / 1000 * 14;
    dynamicBodyTextMedium = _mediaQueryData.size.height / 1000 * 12;
    paddingTop = _mediaQueryData.padding.top;
  }

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double dynamicBodyTextMedium;
  static late double dynamicBodyTextSmall;
  static late double paddingTop;
}
