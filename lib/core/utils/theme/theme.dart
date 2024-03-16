import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      surface: AppColors.colorWhite,
      background: AppColors.colorWhite,
      error: AppColors.colorRed,
      onPrimary: AppColors.colorWhite,
      onSecondary: AppColors.colorWhite,
      onSurface: Colors.black,
      onBackground: AppColors.colorWhite,
      onError: AppColors.colorWhite,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      headline5: heading5,
      headline6: heading6,
      subtitle1: subtitle,
      bodyText2: bodyText,
    ),
  );

  // Part
  static TextStyle get heading5 => GoogleFonts.nunito(
    fontSize: 23,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get heading6 => GoogleFonts.nunito(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static TextStyle get subtitle => GoogleFonts.nunito(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static TextStyle get bodyText => GoogleFonts.nunito(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

}

extension DarkMode on BuildContext {
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}