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
                'assets/image_assets/onboarding3.png',
                height: AdaptSize.screenHeight * .300,
                width: AdaptSize.screenWidth * .9767,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Find Inspiration'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Dapatkan ide cemerlang dengan bekerja di tempat yang nyaman',
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
