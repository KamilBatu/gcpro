import 'package:gcpro/services/token_cache_service/domain/providers/token_cache_provider.dart';
import 'package:gcpro/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:gcpro/services/user_cache_service/data/datasource/user_remote_datasource.dart';
import 'package:gcpro/services/user_cache_service/data/repositories/user_repository_impl.dart';
import 'package:gcpro/services/user_cache_service/domain/models/user_state.dart';
import 'package:gcpro/services/user_cache_service/domain/repositories/user_repository.dart';
import 'package:gcpro/shared/data/local/storage_service.dart';
import 'package:gcpro/shared/domain/providers/dio_network_service_provider.dart';
import 'package:gcpro/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRemoteSourceProvider = AutoDisposeProvider<UserRemoteSource>(
  (ref) => UserRemoteSource(
    ref.watch(networkServiceProvider),
    ref.watch(tokenServiceProvider),
  ),
  name: "userRemoteSourceProvider",
);

final userCacheDataSource = AutoDisposeProvider.family<UserLocalDatasourceImpl,
    (StorageService, UserRemoteSource)>(
  (_, services) => UserLocalDatasourceImpl(services.$1, services.$2),
  name: "userCacheDataSource",
);

final userCacheRepositoryProvider = AutoDisposeProvider<UserCacheRepository>(
  (ref) {
    final storageService = ref.watch(sharedPrefstorageServiceProvider);
    final remoteService = ref.watch(userRemoteSourceProvider);

    final datasource =
        ref.watch(userCacheDataSource((storageService, remoteService)));

    final repository = UserCacheRepositoryImpl(datasource);

    return repository;
  },
  name: "userCacheRepositoryProvider",
);

final userNotifierProvider =
    AutoDisposeStateNotifierProvider<UserNotifier, UserState>(
  (ref) {
    final remoteRepository = ref.watch(userCacheRepositoryProvider);

    return UserNotifier(remoteRepository)..getUser();
  },
  name: 'userNotifierProvider',
);
