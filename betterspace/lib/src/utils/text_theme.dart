import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTextTheme = TextTheme(
  headline1: GoogleFonts.inter(
      fontSize: AdaptSize.screenHeight * .077, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.inter(
      fontSize: AdaptSize.screenHeight * .048, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.inter(
    fontSize: AdaptSize.screenHeight * .038,
    fontWeight: FontWeight.w800,
  ),
  headline4: GoogleFonts.inter(
      fontSize: AdaptSize.screenHeight * .027, fontWeight: FontWeight.w600, letterSpacing: 0.25),
  headline5: GoogleFonts.inter(fontSize: AdaptSize.screenHeight * .022, fontWeight: FontWeight.w600),
  headline6: GoogleFonts.inter(
      fontSize: AdaptSize.screenHeight * .016, fontWeight: FontWeight.w600, letterSpacing: 0.15),
  bodyText1: GoogleFonts.inter(
      fontSize: AdaptSize.screenHeight * .014, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.inter(
      fontSize: AdaptSize.screenHeight * .012, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.inter(
      fontSize: AdaptSize.screenHeight * .014, fontWeight: FontWeight.w500, letterSpacing: 1.25),
);