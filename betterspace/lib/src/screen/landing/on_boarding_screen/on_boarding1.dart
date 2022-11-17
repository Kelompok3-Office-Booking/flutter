import 'package:betterspace/src/utils/adapt_size.dart';
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
            const SizedBox(
              height: 16,
            ),
            const Text('Flexible Workspace'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Kami ada dimanapun dan kapanpun anda butuhkan',
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
