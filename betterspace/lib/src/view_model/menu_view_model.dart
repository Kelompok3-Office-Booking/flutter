import 'package:betterspace/src/screen/menu/account/account_screen.dart';
import 'package:betterspace/src/screen/menu/home/home_screen.dart';
import 'package:betterspace/src/screen/menu/tersimpan/tersimpan_screen.dart';
import 'package:betterspace/src/screen/menu/tersimpan/wishlist_screen.dart';
import 'package:betterspace/src/screen/menu/transaksi/booking_history_screen.dart';

import 'package:betterspace/src/widget/dialog/exit_dialog.dart';
import 'package:flutter/cupertino.dart';

class MenuViewModel with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  final List<Widget> _pages = [
    const HomeScreen(),
    const BookingHistoryScreen(),
    const WishlistScreen(),
    const AccountScreen(),
  ];

  get pages => _pages[_currentPage];

  set onTappeed(int index) {
    _currentPage = index;
    notifyListeners();
  }

  Future<bool> onWillPop(BuildContext context) async {
    if (_currentPage < 0) {
      _currentPage = 0;
      notifyListeners();
      return Future(() => false);
    } else {
      bool exit = await showExitDialog(context) ?? false;
      if (exit) {
        exit = true;
        notifyListeners();
      }
      return Future(() => exit);
    }
  }
}
