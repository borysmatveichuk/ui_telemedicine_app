import 'package:flutter/material.dart';

class AppColorsExtension2 extends ThemeExtension<AppColorsExtension2> {
  AppColorsExtension2( {
    required this.accentColor,
    required this.accentTextColor,
    required this.invertedTextColor,
  });

  final Color accentColor;
  final Color accentTextColor;
  final Color invertedTextColor;

  @override
  ThemeExtension<AppColorsExtension2> copyWith({
    Color? accentColor,
    Color? accentTextColor,
    Color? invertedTextColor,
  }) {
    return AppColorsExtension2(
      accentColor: accentColor ?? this.accentColor,
      accentTextColor: accentTextColor ?? this.accentTextColor,
      invertedTextColor: invertedTextColor ?? this.invertedTextColor,
    );
  }

  @override
  ThemeExtension<AppColorsExtension2> lerp(
      covariant ThemeExtension<AppColorsExtension2>? other, double t) {
    if (other is! AppColorsExtension2) {
      return this;
    }

    return AppColorsExtension2(
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      accentTextColor: Color.lerp(accentTextColor, other.accentTextColor, t)!,
      invertedTextColor: Color.lerp(invertedTextColor, other.invertedTextColor, t)!,
    );
  }
}
