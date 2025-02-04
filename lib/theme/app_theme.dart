import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_telemedicine_app/theme/app_color_extension_2.dart';
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
              color: AppPalette.textTitleColorLight,
              fontWeight: FontWeight.w800),
          headlineMedium: defaultTheme.textTheme.headlineMedium?.copyWith(
              color: AppPalette.textTitleColorLight,
              fontWeight: FontWeight.w600),
          bodyLarge: defaultTheme.textTheme.headlineMedium
              ?.copyWith(color: AppPalette.textTitleColorLight),
          // bodyMedium: defaultTheme.textTheme.headlineMedium
          //     ?.copyWith(color: AppPalette.textTitleColorLight),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
        backgroundColor: AppPalette.infoCardBackgroundColorLight,
        foregroundColor: Color.fromRGBO(119, 121, 125, 1),
      )),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppPalette.buttonColorLight),
      )),
      //hintColor: Colors.amberAccent,
      searchBarTheme: defaultTheme.searchBarTheme.copyWith(
        backgroundColor: WidgetStateProperty.all(
          Color.fromRGBO(234, 243, 249, 1),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
        hintStyle: WidgetStateProperty.all(
            TextStyle(color: AppPalette.textHintColorLight)),
      ),
      extensions: [_lightAppColors, _lightAppColors2],
    );
  }();

  static final _lightAppColors = AppColorsExtension(
    primary: const Color.fromRGBO(63, 102, 136, 1),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color.fromRGBO(110, 187, 204, 1),
    onError: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static final _lightAppColors2 = AppColorsExtension2(
    accentColor: AppPalette.buttonColorLight,
    accentTextColor: AppPalette.textTitleColorLight,
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
              ?.copyWith(color: AppPalette.textTitleColorLight),
        ),
      ),
      extensions: [
        _darkAppColors,
        _darkAppColors2,
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

  static final _darkAppColors2 = AppColorsExtension2(
    accentColor: AppPalette.buttonColorDark,
    accentTextColor: AppPalette.textTitleColorDark,
  );
}

extension AppThemeExtension2 on ThemeData {
  /// Usage example: Theme.of(context).appColors2;
  AppColorsExtension2 get appColors2 =>
      extension<AppColorsExtension2>() ?? AppTheme._lightAppColors2;
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;
}
