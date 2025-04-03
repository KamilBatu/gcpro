import 'dart:async';

import 'package:gcpro/shared/data/local/storage_service.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService implements StorageService {
  SharedPrefsService(this.logger);
  SharedPreferences? sharedPreferences;
  final Logger logger;

  final Completer<SharedPreferences> initCompleter =
      Completer<SharedPreferences>();

  @override
  void init() {
    initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  bool get hasInitialized => sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    sharedPreferences = await initCompleter.future;
    final value = sharedPreferences!.get(key);
    // Log information
    logger.i('Getting $key : $value');

    return value;
  }

  @override
  Future<void> clear() async {
    sharedPreferences = await initCompleter.future;

    // Log information
    logger.i('Clearing all data');

    await sharedPreferences!.clear();
  }

  @override
  Future<bool> has(String key) async {
    sharedPreferences = await initCompleter.future;

    // Log information
    logger.i('Checking if $key exists');

    return sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    sharedPreferences = await initCompleter.future;

    // Log information
    logger.i('Removing $key');

    return sharedPreferences!.remove(key);
  }

  @override
  Future<bool> set(String key, String data) async {
    sharedPreferences = await initCompleter.future;

    // Log information
    logger.i('Setting $key to $data');

    return sharedPreferences!.setString(key, data);
  }
}
