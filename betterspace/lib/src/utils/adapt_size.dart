import 'package:flutter/widgets.dart';

class AdaptSize {
  static size({
    required context,
  }) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    dynamicBodyTextMedium = _mediaQueryData.size.height * .018;
    dynamicBodyTextSmall = _mediaQueryData.size.height / 1000 * 12;

    //padding
    paddingTop = _mediaQueryData.padding.top;
    pixel2 = _mediaQueryData.size.width / 180;
    pixel3 = _mediaQueryData.size.width / 120;
    pixel4 = _mediaQueryData.size.width / 90;
    pixel5 = _mediaQueryData.size.width / 72;
    pixel6 = _mediaQueryData.size.width / 60;
    pixel8 = _mediaQueryData.size.width / 45;
    pixel10 = _mediaQueryData.size.width / 36;
    pixel16 = _mediaQueryData.size.width / 22.5;
    pixel18 = _mediaQueryData.size.width / 20;
    pixel20 = _mediaQueryData.size.width / 18;
    pixel22 = _mediaQueryData.size.width / 16.40;
    pixel24 = _mediaQueryData.size.width / 15;
    pixel26 = _mediaQueryData.size.width / 13.9;
    pixel28 = _mediaQueryData.size.width / 12.9;
    pixel34 = _mediaQueryData.size.width / 10.6;
    pixel40 = _mediaQueryData.size.width / 9;
  }

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double dynamicBodyTextMedium;
  static late double dynamicBodyTextSmall;

  //dynamic padding
  static late double paddingTop;
  static late double pixel2;
  static late double pixel4;
  static late double pixel3;
  static late double pixel5;
  static late double pixel6;
  static late double pixel8;
  static late double pixel10;
  static late double pixel16;
  static late double pixel18;
  static late double pixel20;
  static late double pixel22;
  static late double pixel24;
  static late double pixel26;
  static late double pixel28;
  static late double pixel34;
  static late double pixel40;
}
