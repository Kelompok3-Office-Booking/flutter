import 'dart:async';
import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/screen/landing/auth_screen/login_screen.dart';
import 'package:betterspace/src/screen/landing/auth_screen/register_screen.dart';
import 'package:betterspace/src/screen/landing/on_boarding_screen/on_boarding_view.dart';
import 'package:betterspace/src/screen/menu/account/setting_item_screen/term_condition_screen.dart';
import 'package:betterspace/src/screen/menu/home/detail_office/payment_metod_screen.dart';
import 'package:betterspace/src/screen/menu/home/filter_search_screen.dart';
import 'package:betterspace/src/screen/menu/home/notification_screen.dart';
import 'package:betterspace/src/screen/menu/home/search_space_screen.dart';
import 'package:betterspace/src/screen/menu/transaksi/checkout_screen.dart';
import 'package:betterspace/src/screen/menu/transaksi/detail_order.dart';
import 'package:betterspace/src/screen/menu_screen.dart';
import 'package:betterspace/src/screen/testing%20screen/testing_screen_for_api.dart';
import 'package:betterspace/src/screen/menu/home/detail_office/office_detail_screen.dart';
import 'package:betterspace/src/screen/menu/home/detail_office/payment_detail_screen.dart';
import 'package:betterspace/src/screen/menu/home/detail_office/success_payment_screen.dart';
import 'package:betterspace/src/widget/widget/google_maps.dart';
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
  void navigasiToRegisterScreen(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const RegisterScreen(),
      ),
    );
  }

  /// navigasi onboarding ke register screen
  void navigasiToLoginScreen(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }

  ///navigasi ke terms and condition page
  void navigasiToTermsAndConditionScreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondAnimation) =>
            const TermConditionScreen(),
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

  /// navigasi ke halaman notifikasi
  void navigasiToNotification(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const NotificationScreen(),
      ),
    );
  }

  /// navigasi account setting by index
  void navigasiSettingItem(context, dynamic settingItem) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (contex) => settingItem,
      ),
    );
  }

  /// navigasi log out
  void navigasiLogout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondAnimation) =>
              const LoginScreen(),
          transitionsBuilder: (context, animation, secondAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
        (route) => false);
    notifyListeners();
  }

  /// navigasi onboarding ke register screen
  void navigasiForTesting(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          //change the target widget here

          builder: (context) => const TestingScreenAPI(),
        ),
        (route) => false);
  }

  /// navigasi open google maps
  void navigasiOpenGoogleMaps({
    context,
    required OfficeModels officeId,
  }) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => GoogleMapsWidget(
         officeData: officeId,
        ),
      ),
    );
  }

  /// navigasi open google maps
  void navigasiToPaymentDetail(context, int officeId) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => PaymentDetailScreen(
          officeId: officeId,
        ),
      ),
    );
  }

  /// belum final
  /// navigasi dari detail payment ke success payment
  void navigasiSuccessPayment(context) {
    Navigator.pushAndRemoveUntil(
        context,
        CupertinoModalPopupRoute(
            builder: (context) => const SuccessPaymentScreen()),
        (route) => false);

    notifyListeners();
  }

  /// navigasi back check permission
  Future navigasiBackCheckPermission(BuildContext context) async {
    Navigator.pop(context);
  }

  /// navigasi to search filtering
  void navigasiToFilterSearch(BuildContext context) {
    Timer(
      const Duration(milliseconds: 300),
      () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondAnimation) =>
                const FilterSearchScreen(),
            transitionsBuilder: (context, animation, secondAnimation, child) =>
                FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
      },
    );
    notifyListeners();
  }

  /// navigasi to detail office
  void navigasiToDetailSpace({
    context,
    required String officeId,
  }) {
    Navigator.push(
      context,
      CupertinoModalPopupRoute(
        builder: (context) => OfficeDetailScreen(
          officeID: officeId,
        ),
      ),
    );
  }

  /// navigasi back dari succes payment screen
  Future<bool> navigasiBackToMenu(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      CupertinoDialogRoute(
          builder: (context) => const MenuScreen(), context: context),
    );
    notifyListeners();
    return Future(() => true);
  }

  /// navigasi success screen to detail order
  void navigasiToDetailOrder(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const DetailOrderScreens(),
      ),
    );
    notifyListeners();
  }

  /// navigasi to checkout screen
  void navigasiToCheckOut(BuildContext context, int officeId) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => CheckoutScreen(
          officeId: officeId,
        ),
      ),
    );
  }

  /// navigasi dari sukses screen
  void navigasiBackToBookingHistory(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondAnimation) =>
              const MenuScreen(
            currentIndex: 1,
          ),
          transitionsBuilder: (context, animation, secondAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
        (route) => false);

    notifyListeners();
  }

  /// navigasi to payment method
  void navigasiToPaymentMetod(BuildContext context, int officeId) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => PaymentMetodScreen(
          officeId: officeId,
        ),
      ),
    );
  }
}
