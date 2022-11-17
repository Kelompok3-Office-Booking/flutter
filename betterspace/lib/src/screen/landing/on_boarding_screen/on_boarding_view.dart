import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding1.dart';
import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding2.dart';
import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding3.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardinView extends StatefulWidget {
  const OnBoardinView({Key? key}) : super(key: key);

  @override
  State<OnBoardinView> createState() => _OnBoardinViewState();
}

class _OnBoardinViewState extends State<OnBoardinView> {
  final PageController _pageController = PageController();

  /// list on boarding pages
  final List<Widget> _onBoardingPage = [
    const OnBoardingOne(),
    const OnBoardingTwo(),
    const OnBoardingThree(),
  ];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// inisialisasi media query
    AdaptSize.size(context: context);

    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: _onBoardingPage,
        ),
        Positioned(
          bottom: AdaptSize.screenHeight * .09,
          left: AdaptSize.screenWidth * .04,
          right: AdaptSize.screenWidth * .04,
          child: Column(
            children: [
              /// smooth page indicator
              _buildIndicator(),
              SizedBox(
                height: AdaptSize.screenHeight * .089,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// skip
                  TextButtonWidget(
                    text: 'Skip',
                    onPressed: () {},
                  ),

                  const Spacer(),

                  /// button next
                  ButtonWidget(
                    onPressed: () {},
                    sizeWidth: AdaptSize.screenWidth * .3,
                    sizeheight: AdaptSize.screenHeight * .06,
                    backgroundColor: MyColor.darkColor,
                    borderRadius: BorderRadius.circular(40),
                    child: Text(
                      'Selanjutnya',
                      style: TextStyle(fontSize: AdaptSize.screenHeight * .022),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildIndicator() {
    AdaptSize.size(context: context);
    return SmoothPageIndicator(
      controller: _pageController,
      count: _onBoardingPage.length,
      effect: ExpandingDotsEffect(
        dotWidth: AdaptSize.screenWidth * .021,
        dotHeight: AdaptSize.screenHeight * .011,
        dotColor: MyColor.grayLightColor,
        activeDotColor: MyColor.darkColor,
      ),
    );
  }
}
