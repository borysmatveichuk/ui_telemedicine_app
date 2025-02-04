import 'package:flutter/material.dart';

class AppColorsExtension2 extends ThemeExtension<AppColorsExtension2> {
  AppColorsExtension2({
    required this.accentColor,
    required this.accentTextColor,
  });

  final Color accentColor;
  final Color accentTextColor;

  @override
  ThemeExtension<AppColorsExtension2> copyWith({
    Color? accentColor,
    Color? accentTextColor,
  }) {
    return AppColorsExtension2(
      accentColor: accentColor ?? this.accentColor,
      accentTextColor: accentTextColor ?? this.accentTextColor,
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
    );
  }
}
