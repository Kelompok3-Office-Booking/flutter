import 'package:auto_size_text/auto_size_text.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// inisialisasi media query
    AdaptSize.size(context: context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                'assets/image_assets/onboarding1.png',
                height: AdaptSize.screenHeight * .3,
                width: AdaptSize.screenWidth * .9767,
              ),
            ),
            SizedBox(
              height: AdaptSize.screenHeight * .026,
            ),
            AutoSizeText(
              'Flexible Workspace',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: MyColor.darkColor),
              maxLines: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            AutoSizeText(
              'Kami ada dimanapun dan kapanpun anda butuhkan',
              style: Theme.of(context).textTheme.bodyText1,
              minFontSize: 10,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
