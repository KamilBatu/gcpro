import 'package:gcpro/services/services_provider.dart';
import 'package:gcpro/shared/domain/providers/secured_storage_service_provider.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenCheckProvider = AutoDisposeFutureProvider(
  (ref) async {
    final repo = ref.watch(tokenServiceProvider);
    return repo.hasToken();
  },
  name: 'tokenCheckProvider',
);

final firstTimeCheckProvider = AutoDisposeFutureProvider(
  (ref) async {
    final secureStorage = ref.watch(secureStorageServiceProvider);
    return secureStorage.has(FIRST_TIME_KEY);
  },
  name: 'firstTimeCheckProvider',
);
