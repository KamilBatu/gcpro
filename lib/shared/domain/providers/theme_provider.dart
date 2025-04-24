import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  ThemeMode build() => ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    state = themeMode;
  }

  bool isDark() => state == ThemeMode.dark;
}
