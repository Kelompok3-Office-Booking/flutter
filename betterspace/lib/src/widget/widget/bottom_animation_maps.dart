import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/bottom_sheed_widget.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/line_dash_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget bottomAnimationMaps({
  context,
  required String userAddress,
  required String officeAddress,
  required String distance,
  required Function()? onPressed,
}) {
  return SizedBox(
    height: AdaptSize.screenHeight * .1,
    width: AdaptSize.screenHeight * .1,
    child: GestureDetector(
      onTap: () {
        modalBottomSheed(
          context,
          bottomDetailMaps(
            context: context,
            userAddress: userAddress,
            officeAddres: officeAddress,
            distance: distance,
            onPressed: onPressed,
          ),
        );
      },
      child: Lottie.asset(
        'assets/lottie_assets/swipe_up.json',
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget bottomDetailMaps({
  context,
  required String userAddress,
  required String officeAddres,
  required String distance,
  required Function()? onPressed,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: AdaptSize.screenHeight * .005,
          left: AdaptSize.screenHeight * .016,
          right: AdaptSize.screenHeight * .016,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:
                  dividerWdiget(width: AdaptSize.screenWidth * .1, opacity: .4),
            ),
            Text(
              'Your location',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: MyColor.neutral400,
                  fontSize: AdaptSize.screenHeight * .014),
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .008,
            ),

            /// office location
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: MyColor.secondary400,
                  size: AdaptSize.screenHeight * .024,
                ),
                SizedBox(
                  width: AdaptSize.screenWidth * .012,
                ),
                Expanded(
                  child: Text(
                    userAddress,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: AdaptSize.screenHeight * .016),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .008,
            ),

            LineDashWidget(
              color: MyColor.neutral500,
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .008,
            ),

            Text(
              'Office location',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: MyColor.neutral400,
                  fontSize: AdaptSize.screenHeight * .014),
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .008,
            ),

            /// office location
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: MyColor.secondary400,
                  size: AdaptSize.screenHeight * .024,
                ),
                SizedBox(
                  width: AdaptSize.screenWidth * .012,
                ),
                Text(
                  officeAddres,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: AdaptSize.screenHeight * .016),
                ),
              ],
            ),

            SizedBox(
              height: AdaptSize.screenHeight * .008,
            ),
          ],
        ),
      ),
      dividerWdiget(width: double.infinity, opacity: .5),
      Padding(
        padding: EdgeInsets.only(
          left: AdaptSize.screenHeight * .016,
          right: AdaptSize.screenHeight * .016,
          top: AdaptSize.screenHeight * .008,
        ),
        child: Text(
          'Distance',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: MyColor.neutral400,
              fontSize: AdaptSize.screenHeight * .014),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: AdaptSize.screenHeight * .016,
          right: AdaptSize.screenHeight * .016,
        ),
        child: Row(
          children: [
            Icon(
              Icons.social_distance_outlined,
              color: MyColor.secondary400,
              size: AdaptSize.screenHeight * .024,
            ),
            SizedBox(
              width: AdaptSize.screenWidth * .012,
            ),
            Text(distance),
            const Spacer(),
            buttonWidget(
              onPressed: onPressed,
              backgroundColor: MyColor.secondary400,
              borderRadius: BorderRadius.circular(10),
              child: Text(
                'Go to office location',
                style: Theme.of(context).textTheme.button!.copyWith(
                    color: MyColor.neutral900,
                    fontSize: AdaptSize.screenHeight * .014),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: AdaptSize.screenHeight * .025,
      ),
    ],
  );
}
