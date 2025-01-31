import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    state = ThemeMode.light;
    print('default theme mode: ${state.toString()}');
    return state;
  }

  set themeMode(ThemeMode themeMode) {
    state = themeMode;
  }
}

final appThemeProvider =
    NotifierProvider<AppThemeNotifier, ThemeMode>(AppThemeNotifier.new);
