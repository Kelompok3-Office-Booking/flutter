import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myTextTheme = TextTheme(
  headline1: GoogleFonts.josefinSans(
      fontSize: AdaptSize.screenHeight * .077, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.josefinSans(
      fontSize: AdaptSize.screenHeight * .048, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.josefinSans(
    fontSize: AdaptSize.screenHeight * .038,
    fontWeight: FontWeight.w800,
  ),
  headline4: GoogleFonts.josefinSans(
      fontSize: 27, fontWeight: FontWeight.w600, letterSpacing: 0.25),
  headline5: GoogleFonts.josefinSans(fontSize: AdaptSize.screenHeight * .022, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.josefinSans(
      fontSize: AdaptSize.screenHeight * .016, fontWeight: FontWeight.w600, letterSpacing: 0.15),
  bodyText1: GoogleFonts.josefinSans(
      fontSize: AdaptSize.screenHeight * .015, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.josefinSans(
      fontSize: AdaptSize.screenHeight * .014, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.josefinSans(
      fontSize: AdaptSize.screenHeight * .014, fontWeight: FontWeight.w500, letterSpacing: 1.25),
);