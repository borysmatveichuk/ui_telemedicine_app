import 'package:flutter/material.dart';

abstract class AppPalette {
  // Grey
  static const grey = _GreyColors();

  static const Color textTitleColorLight = Color.fromRGBO(51, 102, 137, 1);
  static const Color textTitleColorDark = Color.fromRGBO(51, 102, 137, 1);
  static const Color textHintColorLight = Color.fromRGBO(157, 166, 171, 1);
  static const Color textOnButtonColorLight = Colors.white;
  static const Color textOnButtonColorDark = Colors.white;
  static const Color infoCardBackgroundColorLight = Color.fromRGBO(234, 243, 249, 1);
  static const Color buttonColorLight = Color.fromRGBO(52, 168, 195, 1);
  static const Color buttonColorDark = Color.fromRGBO(52, 168, 195, 1);
}

/// Usage example: `AppPalette.grey.grey50`.
class _GreyColors {
  const _GreyColors();

  final grey50 = const Color(0xFFFAFAFA);
  final grey100 = const Color(0xFFF5F5F5);
}