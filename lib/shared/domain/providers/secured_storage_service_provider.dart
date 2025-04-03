import 'package:gcpro/shared/data/local/secured_storage_service.dart';
import 'package:gcpro/shared/domain/providers/log_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final secureStorageServiceProvider = Provider(
  (ref) {
    final logger = ref.watch(logProvider);
    final secureStorageService = SecureStorageService(logger)..init();
    return secureStorageService;
  },
  name: 'secureStorageServiceProvider',
);
