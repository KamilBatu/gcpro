// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../data/repositories/settings_repository_impl.dart';

// final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
//   final datasource = ref.watch(settingsDatasourceProvider);
//   return SettingsRepositoryImpl(datasource);
// });

// final settingsNotifierProvider =
//     StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
//   final repository = ref.watch(settingsRepositoryProvider);
//   return SettingsNotifier(repository)..fetchData();
// });
