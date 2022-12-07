import 'package:betterspace/src/model/onboarding_model.dart';
import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding_screen.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/get_location_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/onboarding_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardinView extends StatefulWidget {
  const OnBoardinView({Key? key}) : super(key: key);

  @override
  State<OnBoardinView> createState() => _OnBoardinViewState();
}

class _OnBoardinViewState extends State<OnBoardinView> {
  final PageController _pageController = PageController();
  
  @override
  initState() {
    super.initState();
    Provider.of<GetLocationViewModel>(context, listen: false)
        .checkAndGetPosition();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// inisialisasi media query
    AdaptSize.size(context: context);

    return Scaffold(
      body: Stack(
        children: [
          /// view
          Consumer<OnboardingViewModel>(builder: (context, value, child) {
            return PageView.builder(
              controller: _pageController,
              itemCount: value.onboardList.length,
              onPageChanged: (index) {
                value.getStarted(index == 2);
              },
              itemBuilder: (context, index) {
                final OnboardingModel onboard = value.onboardList[index];
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
            left: AdaptSize.screenWidth * .05,
            right: AdaptSize.screenWidth * .05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// skip
                textButtonWidget(
                  text: 'Skip',
                  textStyle: Theme.of(context).textTheme.button!.copyWith(
                        color: MyColor.grayLightColor,
                      ),
                  onPressed: () {
                    context
                        .read<NavigasiViewModel>()
                        .navigasiToRegisterScreen(context);
                  },
                ),

                const Spacer(),

                /// button next
                Consumer<OnboardingViewModel>(builder: (context, value, child) {
                  return value.lastPage
                      ? buttonWidget(
                          onPressed: () {
                            context
                                .read<NavigasiViewModel>()
                                .navigasiToRegisterScreen(context);
                          },
                          sizeWidth: AdaptSize.screenWidth * .3,
                          sizeheight: AdaptSize.screenHeight * .06,
                          backgroundColor: MyColor.darkBlueColor,
                          borderRadius: BorderRadius.circular(10),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Get Started',
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: MyColor.whiteColor),
                            ),
                          ),
                        )
                      : buttonWidget(
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
                        );
                })
              ],
            ),
          )
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
