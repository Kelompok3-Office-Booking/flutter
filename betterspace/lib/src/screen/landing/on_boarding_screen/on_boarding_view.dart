import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding1.dart';
import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding2.dart';
import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding3.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
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
        /// view
        PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return _onBoardingPage[index % _onBoardingPage.length];
          },
        ),

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
              TextButtonWidget(
                text: 'Lewati',
                fontColor: MyColor.grayLightColor,
                onPressed: () {
                  context
                      .read<NavigasiViewModel>()
                      .navigasiToLoginScreen(context);
                },
              ),

              const Spacer(),

              /// button next
              ButtonWidget(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.ease);
                },
                sizeWidth: AdaptSize.screenWidth * .3,
                sizeheight: AdaptSize.screenHeight * .06,
                backgroundColor: MyColor.darkBlueColor,
                borderRadius: BorderRadius.circular(10),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Selanjutnya',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: MyColor.whiteColor),
                  ),
                ),
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
