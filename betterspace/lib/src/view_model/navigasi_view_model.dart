import 'dart:async';
import 'package:betterspace/src/screen/landing/auth_screen/login_screen.dart';
import 'package:betterspace/src/screen/landing/auth_screen/register_screen.dart';
import 'package:betterspace/src/screen/landing/auth_screen/terms_condition.dart';
import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding_view.dart';
import 'package:betterspace/src/screen/menu/home/notification_screen.dart';
import 'package:betterspace/src/screen/menu/home/search_space_screen.dart';

import 'package:betterspace/src/screen/menu_screen.dart';
import 'package:betterspace/src/widget/home_widget/office_detail_widget/office_detail_screen.dart';
import 'package:flutter/cupertino.dart';

class NavigasiViewModel with ChangeNotifier {
  /// navigasi splash 2 ke onboarding view
  void navigasiToOnboardingView(BuildContext context) {
    Timer(
      const Duration(milliseconds: 300),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondAnimation) =>
                  const OnBoardinView(),
              transitionsBuilder:
                  (context, animation, secondAnimation, child) =>
                      FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
            (route) => false);
      },
    );
    notifyListeners();
  }

  /// navigasi kembali
  void navigasiPop(BuildContext context) {
    Navigator.pop(context);
  }

  /// navigasi register ke login screen
  void navigasiToLoginScreen(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  /// navigasi onboarding ke register screen
  void navigasiToRegisterScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
        (route) => false);
  }

  /// navigasi onboarding ke register screen
  void navigasiToOfficeDetail(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => const OfficeDetailScreen(),
        ),
        (route) => false);
  }

  ///navigasi ke terms and condition page
  void navigasiToTermsAndConditionScreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) =>
            const TermsAndConditionViews(),
        transitionDuration: const Duration(milliseconds: 1200),
        transitionsBuilder: (context, animation, secondAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.linearToEaseOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  /// navigasi login ke menu screen
  void navigasiToMenuScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondAnimation) =>
              const MenuScreen(),
          transitionDuration: const Duration(milliseconds: 1200),
          transitionsBuilder: (context, animation, secondAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.linearToEaseOut;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
        (route) => false);
  }

  /// navigasi home ke search screen
  void navigasiToSearchSpaces(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const SearchSpaceScreen(),
      ),
    );
  }

  void navigasiToNotification(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const NotificationScreen(),
      ),
    );
  }
}
