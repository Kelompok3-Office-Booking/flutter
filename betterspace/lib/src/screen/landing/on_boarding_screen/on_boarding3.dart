import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// inisialisasi media query
    AdaptSize.size(context: context);

    return Scaffold(
      backgroundColor: MyColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: AdaptSize.screenWidth * .04,
            right: AdaptSize.screenWidth * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AdaptSize.screenHeight * .14,
            ),
            Center(
              child: Image.asset(
                'assets/image_assets/onboarding3.png',
                height: AdaptSize.screenHeight * .3,
                width: AdaptSize.screenWidth * .9767,
              ),
            ),
            SizedBox(
              height: AdaptSize.screenHeight * .1,
            ),
            Text(
              'Find Inspiration',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: MyColor.darkColor),

              maxLines: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Dapatkan ide cemerlang dengan bekerja di tempat yang nyaman',
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
