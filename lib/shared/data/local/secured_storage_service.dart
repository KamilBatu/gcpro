import 'dart:async';

import 'package:gcpro/shared/data/local/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class SecureStorageService implements StorageService {
  SecureStorageService(this.logger);
  late final FlutterSecureStorage _secureStorage;
  final Logger logger;
  bool _initialized = false;

  @override
  void init() {
    _secureStorage = const FlutterSecureStorage();
    _initialized = true;
  }

  @override
  bool get hasInitialized => _initialized;

  @override
  Future<String?> get(String key) async {
    if (!_initialized) {
      throw Exception('Storage service has not been initialized');
    }

    final value = await _secureStorage.read(key: key);

    // Log information
    logger.i('Getting $key: $value');

    return value;
  }

  @override
  Future<void> clear() async {
    if (!_initialized) {
      throw Exception('Storage service has not been initialized');
    }

    // Log information
    logger.i('Clearing all data');

    await _secureStorage.deleteAll();
  }

  @override
  Future<bool> has(String key) async {
    if (!_initialized) {
      throw Exception('Storage service has not been initialized');
    }

    // Log information
    logger.i('Checking if $key exists');

    final value = await _secureStorage.read(key: key);
    return value != null;
  }

  @override
  Future<bool> remove(String key) async {
    if (!_initialized) {
      throw Exception('Storage service has not been initialized');
    }

    // Log information
    logger.i('Removing $key');

    await _secureStorage.delete(key: key);
    return true;
  }

  @override
  Future<bool> set(String key, String data) async {
    // Convert data to string before saving
    if (!_initialized) {
      throw Exception('Storage service has not been initialized');
    }

    // Log information
    logger.i('Saving $data to $key');

    await _secureStorage.write(key: key, value: data);
    return true;
  }
}
