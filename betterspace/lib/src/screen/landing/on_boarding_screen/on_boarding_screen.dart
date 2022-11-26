import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnBoardingScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

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
                image,
                height: AdaptSize.screenHeight * .3,
                width: AdaptSize.screenWidth * .9767,
              ),
            ),
            SizedBox(
              height: AdaptSize.screenHeight * .1,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: MyColor.darkColor,
                    fontSize: AdaptSize.screenHeight * .025,
                  ),
              maxLines: 1,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              description,
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