import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:betterspace/src/screen/landing/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenOne extends StatelessWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //need review!
    //pakai package animated splash screen
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg_assets/logo.svg',
            ),
          ],
        ),
      ),
      nextScreen: const SplashScreenTwo(),
      splashIconSize: 250, //icon size
      duration: 800, //durasi splash
      splashTransition:
          SplashTransition.fadeTransition, //animasi transisi splash element
      pageTransitionType:
          PageTransitionType.topToBottom, //animasi transisi ganti page
    );
  }
}
