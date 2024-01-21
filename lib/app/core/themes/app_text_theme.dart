import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _robotoTextStyle = GoogleFonts.roboto();

final appTextTheme = TextTheme(
  displayLarge: _robotoTextStyle.copyWith(
    fontSize: 32,
    letterSpacing: -0.25,
    fontWeight: FontWeight.w800,
  ),
  headlineLarge: _robotoTextStyle.copyWith(
    fontSize: 32,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: _robotoTextStyle.copyWith(
    fontSize: 28,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  ),
  titleMedium: _robotoTextStyle.copyWith(
    fontSize: 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w400,
  ),
  labelLarge: _robotoTextStyle.copyWith(
    fontSize: 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w700,
  ),
  labelMedium: _robotoTextStyle.copyWith(
    fontSize: 14,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  ),
  labelSmall: _robotoTextStyle.copyWith(
    fontSize: 14,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  ),
  bodyLarge: _robotoTextStyle.copyWith(
    fontSize: 12,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w800,
  ),
  bodyMedium: _robotoTextStyle.copyWith(
    fontSize: 12,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w500,
  ),
  bodySmall: _robotoTextStyle.copyWith(
    fontSize: 12,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  ),
);
