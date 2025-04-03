import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro/shared/data/local/secure_storage_const.dart';
import 'package:gcpro/shared/data/local/storage_service.dart';
import 'package:gcpro/shared/domain/providers/shared_preferences_storage_service_provider.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>(
  (ref) {
    final storage = ref.watch(sharedPrefstorageServiceProvider);
    return AppThemeModeNotifier(storage as StorageService);
  },
  name: 'appThemeProvider',
);

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  AppThemeModeNotifier(this.storageService) : super(ThemeMode.light) {
    getCurrentTheme();
  }
  final StorageService storageService;

  ThemeMode currentTheme = ThemeMode.light;

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    storageService.set(APP_THEME_STORAGE_KEY, state.name);
  }

  Future<void> getCurrentTheme() async {
    final theme = await storageService.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${theme ?? 'light'}');
    state = value;
  }
}
