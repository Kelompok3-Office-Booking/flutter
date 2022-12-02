import 'package:betterspace/src/model/onboarding_model.dart';
import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding_screen.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/onboarding_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppbarWidget(
        context: context,
        titles: Text(
          'About',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: AdaptSize.pixel16,
              ),
        ),
        titleSpacer: AdaptSize.pixel16,
        leadingIcon: IconButton(
          onPressed: () {
            context.read<NavigasiViewModel>().navigasiPop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColor.darkColor,
            size: AdaptSize.pixel16,
          ),
        ),
      ),
      body: Stack(
        children: [
          /// view
          Consumer<OnboardingViewModel>(builder: (context, value, child) {
            return PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                final OnboardingModel onboard =
                    value.onboardList[index % value.onboardList.length];
                return OnBoardingScreen(
                  image: onboard.image,
                  title: onboard.title,
                  description: onboard.description,
                );
              },
            );
          }),

          /// animasi smooth indicator
          Positioned(
            top: AdaptSize.screenHeight * .48,
            left: AdaptSize.screenWidth * .4,
            right: AdaptSize.screenWidth * .4,
            child: _buildIndicator(),
          ),

          /// button
          Positioned(
            bottom: AdaptSize.screenHeight * .07,
            right: AdaptSize.screenWidth * .05,
            child: buttonWidget(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.ease,
                );
              },
              sizeWidth: AdaptSize.screenWidth * .3,
              sizeheight: AdaptSize.screenHeight * .06,
              backgroundColor: MyColor.darkBlueColor,
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Next',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: MyColor.whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    final pageIndex = Provider.of<OnboardingViewModel>(context, listen: false);
    AdaptSize.size(context: context);
    return SmoothPageIndicator(
      controller: _pageController,
      count: pageIndex.onboardList.length,
      effect: ExpandingDotsEffect(
        dotWidth: AdaptSize.screenWidth * .021,
        dotHeight: AdaptSize.screenHeight * .011,
        dotColor: MyColor.grayLightColor,
        activeDotColor: MyColor.darkColor,
      ),
    );
  }
}
