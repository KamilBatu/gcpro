// import 'package:gcpro/features/authentication/presentation/providers/auth_providers.dart';
// import 'package:gcpro/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:gcpro/services/user_cache_service/data/datasource/profile_local_datasource.dart';
import 'package:gcpro/services/user_cache_service/data/repositories/profile_repository_impl.dart';
import 'package:gcpro/services/user_cache_service/domain/repositories/profile_repository.dart';
import 'package:gcpro/shared/data/local/storage_service.dart';
import 'package:gcpro/shared/domain/providers/shared_preferences_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileDatasourceProvider =
    AutoDisposeProvider.family<LocalDefaultProfileDataSource, StorageService>(
  (_, networkService) => ProfileLocalDatasource(networkService),
  name: "profileDatasourceProvider",
);

final profileLocalRepositoryProvider =
    AutoDisposeProvider<ProfileCacheRepository>(
  (ref) {
    final storageService = ref.watch(sharedPrefstorageServiceProvider);

    final datasource = ref.watch(profileDatasourceProvider(storageService));

    final repository = ProfileCacheRepositoryImpl(datasource);

    return repository;
  },
  name: "profileLocalRepositoryProvider",
);

final currentLocalProfileProvider = AutoDisposeFutureProvider<String?>(
  (ref) async {
    final repository = ref.watch(profileLocalRepositoryProvider);

    // ref.listen(authStateNotifierProvider, (previous, next) {
    //   if (next is Success && next.success == SuccessState.userLoggedOut) {
    //     repository.deleteProfile();
    //   }
    // });

    final eitherType = await repository.fetchProfile();

    return eitherType.fold((l) => null, (r) => r);
  },
  name: 'currentLocalProfileProvider',
);
