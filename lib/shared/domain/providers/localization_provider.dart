import 'package:gcpro/shared/data/local/secured_storage_service.dart';
import 'package:gcpro/shared/domain/providers/secured_storage_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localizationProvider =
    StateNotifierProvider<LocalizationNotifier, Locale>(
  (ref) {
    return LocalizationNotifier(ref.watch(secureStorageServiceProvider))
      .._loadLocale();
  },
);

class LocalizationNotifier extends StateNotifier<Locale> {
  LocalizationNotifier(this._storageService) : super(const Locale('en')) {
    _loadLocale();
  }
  final SecureStorageService _storageService;

  Future<void> _loadLocale() async {
    final localeString = await _storageService.get('locale');
    if (localeString != null) {
      state = Locale(localeString);
    }
  }

  Future<void> updateLocale(Locale newLocale) async {
    state = newLocale;
    await _storageService.set('locale', newLocale.languageCode);
  }
}
