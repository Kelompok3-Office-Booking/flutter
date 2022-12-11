import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardShimmerHomeLoading {
  /// shimmer card widget only home screen
  static Widget verticalShimmerHome = Container(
    margin: const EdgeInsets.only(
      left: 5,
      right: 5,
      bottom: 10,
    ),
    padding: EdgeInsets.all(
      AdaptSize.screenHeight * .01,
    ),
    width: AdaptSize.screenWidth * .45,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 3),
          color: MyColor.grayLightColor.withOpacity(.4),
          blurRadius: 3,
        ),
      ],
      borderRadius: BorderRadius.circular(16),
    ),
    child: SvgPicture.asset('assets/svg_assets/logo.svg'),
  );

  /// shimmer card load failed only home screen
  static Widget verticalFailedLoadShimmer = Container(
    margin: const EdgeInsets.only(
      left: 5,
      right: 5,
      bottom: 10,
    ),
    padding: EdgeInsets.all(
      AdaptSize.screenHeight * .01,
    ),
    width: AdaptSize.screenWidth * .45,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 3),
          color: MyColor.grayLightColor.withOpacity(.4),
          blurRadius: 3,
        ),
      ],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.heart_broken_outlined,
            color: MyColor.danger400,
            size: AdaptSize.screenHeight * .1,
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .016,
          ),
          Text(
            'sorry an error occurred',
            style: TextStyle(
              fontSize: 15,
              color: MyColor.neutral600,
            ),
          ),
        ],
      ),
    ),
  );

  /// shimmer card horizontal load only home screen
  static Widget horizontalLoadShimmerHome = Container(
    height: AdaptSize.screenHeight * .16,
    width: double.infinity,
    margin: EdgeInsets.only(
      bottom: AdaptSize.screenHeight * .008,
    ),
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 3),
          color: MyColor.grayLightColor.withOpacity(.4),
          blurRadius: 3,
        ),
      ],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: SvgPicture.asset('assets/svg_assets/logo.svg'),
    ),
  );

  /// shimmer card horizontal load failed only home screen
  static Widget horizontalFailedShimmerHome = Container(
    height: AdaptSize.screenHeight * .16,
    width: double.infinity,
    margin: EdgeInsets.only(
      bottom: AdaptSize.screenHeight * .008,
    ),
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 3),
          color: MyColor.grayLightColor.withOpacity(.4),
          blurRadius: 3,
        ),
      ],
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.heart_broken_outlined,
            color: MyColor.danger400,
            size: AdaptSize.screenHeight * .1,
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .016,
          ),
          Text(
            'sorry an error occurred',
            style: TextStyle(
              fontSize: 15,
              color: MyColor.neutral600,
            ),
          ),
        ],
      ),
    ),
  );
}

/// common shimmer load
Widget commonShimmerLoadWidget({
  double? sizeHeight,
  double? sizeWidth,
}) {
  return Container(
    height: sizeHeight,
    width: sizeWidth,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 3),
          color: MyColor.grayLightColor.withOpacity(.4),
          blurRadius: 3,
        ),
      ],
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: SvgPicture.asset('assets/svg_assets/logo.svg'),
    ),
  );
}

/// common shimmer failed load
Widget commonShimmerFailedLoadWidget({
  double? sizeHeight,
  double? sizeWidth,
}) {
  return Container(
    height: sizeHeight,
    width: sizeWidth,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 3),
          color: MyColor.grayLightColor.withOpacity(.4),
          blurRadius: 3,
        ),
      ],
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.heart_broken_outlined,
            color: MyColor.danger400,
            size: AdaptSize.screenHeight * .1,
          ),
          SizedBox(
            height: AdaptSize.screenHeight * .016,
          ),
          Text(
            'sorry an error occurred',
            style: TextStyle(
              fontSize: 15,
              color: MyColor.neutral600,
            ),
          ),
        ],
      ),
    ),
  );
}

