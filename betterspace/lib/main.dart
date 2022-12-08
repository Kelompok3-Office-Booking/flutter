import 'package:betterspace/src/dummy_data/office_data/office_dummy_data.dart';
import 'package:betterspace/src/screen/landing/splash_screen1.dart';
import 'package:betterspace/src/screen/menu/home/voucer_promo_screen.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/utils/text_theme.dart';
import 'package:betterspace/src/view_model/account_view_model.dart';
import 'package:betterspace/src/view_model/get_location_view_model.dart';
import 'package:betterspace/src/view_model/login_view_model.dart';
import 'package:betterspace/src/view_model/menu_view_model.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/onboarding_view_model.dart';
import 'package:betterspace/src/view_model/promo_view_model.dart';
import 'package:betterspace/src/view_model/search_spaces_view_model.dart';
import 'package:betterspace/src/view_model/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BetterSpaceApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class BetterSpaceApp extends StatelessWidget {
  const BetterSpaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigasiViewModel()),
        ChangeNotifierProvider(create: (_) => OfficeDummyDataViewModels()),
        ChangeNotifierProvider(create: (_) => MenuViewModel()),
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
        ChangeNotifierProvider(create: (_) => SearchSpacesViewModel()),
        ChangeNotifierProvider(create: (_) => PromoViewModel()),
        ChangeNotifierProvider(create: (_) => GetLocationViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AccountViewModel()),
        ChangeNotifierProvider(create: (_) => TransactionViewModel()),
      ],
      child: MaterialApp(
        home: const SplashScreenOne(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: MyColor.neutral900,
          textTheme: myTextTheme,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: MyColor.whiteColor),
        ),
        routes: {
          VoucerPromoScreen.routeName: (_) => const VoucerPromoScreen(),
        },
      ),
    );
  }
}
