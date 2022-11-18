import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({Key? key}) : super(key: key);

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
                'assets/image_assets/onboarding2.png',
                height: AdaptSize.screenHeight * .3,
                width: AdaptSize.screenWidth * .9767,
              ),
            ),
            SizedBox(
              height: AdaptSize.screenHeight * .1,
            ),
            Text(
              'Cozy Workspace',
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
              'Memberikan kenyamanan juga layanan terbaik untuk teman kerja anda',
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
