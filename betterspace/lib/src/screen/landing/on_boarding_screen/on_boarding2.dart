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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AdaptSize.screenHeight * .14,
            ),
            Center(
              child: Image.asset(
                'assets/image_assets/onboarding2.png',
                height: AdaptSize.screenHeight * .300,
                width: AdaptSize.screenWidth * .9767,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Build Relation'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Berjalan bersama orang - orang yang sejalan dengan anda',
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
