import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_telemedicine_app/theme/app_palette.dart';

import 'app_color_extension.dart';

class AppTheme {
  //
  // Light theme
  //

  static final light = () {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      textTheme: GoogleFonts.gantariTextTheme(
        defaultTheme.textTheme.copyWith(
          headlineLarge: defaultTheme.textTheme.headlineLarge?.copyWith(
              color: AppPalette.textTitleColor, fontWeight: FontWeight.w800),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
        backgroundColor: Color.fromRGBO(234, 243, 249, 1),
        foregroundColor: Color.fromRGBO(119, 121, 125, 1),
      )),
      extensions: [
        _lightAppColors,
      ],
    );
  }();

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color.fromRGBO(110, 187, 204, 1),
    onError: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  //
  // Dark theme
  //

  static final dark = () {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      textTheme: GoogleFonts.gantariTextTheme(
        defaultTheme.textTheme.copyWith(
          headlineLarge: defaultTheme.textTheme.headlineLarge
              ?.copyWith(color: AppPalette.textTitleColor),
        ),
      ),
      extensions: [
        _darkAppColors,
      ],
    );
  }();

  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xffbb86fc),
    onPrimary: Colors.black,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffcf6679),
    onError: Colors.black,
    surface: const Color(0xff121212),
    onSurface: Colors.white,
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;
}
