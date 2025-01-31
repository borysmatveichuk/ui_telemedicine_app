import 'package:flutter/material.dart';

abstract class AppPalette {
  // Grey
  static const grey = _GreyColors();

  static const Color textTitleColor = Color.fromRGBO(63, 102, 136, 1);
}

/// Usage example: `AppPalette.grey.grey50`.
class _GreyColors {
  const _GreyColors();

  final grey50 = const Color(0xFFFAFAFA);
  final grey100 = const Color(0xFFF5F5F5);
}