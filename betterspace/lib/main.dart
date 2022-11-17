import 'package:betterspace/src/screen/landing/splash_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/screen/landing/on_boarding_screen/on_boarding_view.dart';

void main() {
  runApp(const BetterSpaceApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class BetterSpaceApp extends StatelessWidget {
  const BetterSpaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardinView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
