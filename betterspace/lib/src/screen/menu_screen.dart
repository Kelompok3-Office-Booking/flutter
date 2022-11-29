import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/menu_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuViewModel>(builder: (context, value, child) {
      return WillPopScope(
        onWillPop: () async {
          return value.onWillPop(context);
        },
        child: Scaffold(
          extendBody: true,
          body: value.pages,
          bottomNavigationBar: _bottomNavBar(context),
        ),
      );
    });
  }

  Container _bottomNavBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AdaptSize.screenHeight * .01,
        right: AdaptSize.screenHeight * .01,
        bottom: AdaptSize.screenHeight * .015,
      ),
      height: AdaptSize.screenHeight * .075,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColor.pc300,
        border: Border.all(
          color: MyColor.pc600,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Consumer<MenuViewModel>(builder: (context, value, index) {
        return BottomNavigationBar(
          backgroundColor: MyColor.transparanColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColor.whiteColor,
          unselectedItemColor: MyColor.pc700,
          selectedIconTheme: IconThemeData(size: AdaptSize.screenHeight * .028),
          selectedLabelStyle:
              TextStyle(fontSize: AdaptSize.screenHeight * .013),
          unselectedFontSize: AdaptSize.screenHeight * .011,
          onTap: (index) {
            value.onTappeed = index;
          },
          currentIndex: value.currentPage,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar),
              label: 'Transaksi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
            ),
          ],
        );
      }),
    );
  }
}
