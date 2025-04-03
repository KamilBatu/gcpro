/// Storage service interface
abstract class StorageService {
  void init();

  bool get hasInitialized;

  Future<bool> remove(String key);

  Future<dynamic> get(String key);

  Future<bool> set(String key, String data);

  Future<bool> has(String key);

  Future<void> clear();
}
