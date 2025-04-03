import 'package:gcpro/configs/app_configs.dart';
import 'package:gcpro/services/token_cache_service/data/repositories/token_repository_impl.dart';
import 'package:gcpro/services/token_cache_service/domain/repositories/token_cache_repository.dart';
import 'package:gcpro/shared/domain/providers/secured_storage_service_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenServiceProvider = Provider<TokenRepository>(
  (ref) {
    final secureStorage = ref.watch(secureStorageServiceProvider);
    final dio = Dio(BaseOptions(baseUrl: AppConfigs.baseUrl));

    return TokenRepositoryImpl(dio, secureStorage);
  },
  name: 'tokenServiceProvider',
);
